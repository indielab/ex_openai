defmodule ExOpenAI.Codegen.TypespecGenerator do
  @moduledoc """
  Generates Elixir typespecs from OpenAPI Schema structs.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.SchemaResolver

  @doc """
  Converts a Schema struct into an Elixir typespec AST.
  """
  @spec schema_to_typespec(Schema.t(), %{optional(String.t()) => Schema.t()}) :: Macro.t()
  def schema_to_typespec(%Schema{} = schema, schemas \\ %{}) do
    resolved_schema = maybe_resolve_schema(schema, schemas)
    base_type = get_base_type(resolved_schema, schemas)

    # Wrap in nullable if needed
    if resolved_schema.nullable do
      quote do
        unquote(base_type) | nil
      end
    else
      base_type
    end
  end

  # Get the base type without nullable wrapper
  defp get_base_type(%Schema{type: "string", format: "binary"}, _schemas) do
    # Binary string – used for file uploads (e.g. image, audio).
    # Represent this as a raw binary instead of String.t().
    quote do: binary()
  end

  defp get_base_type(%Schema{type: "string", enum: nil}, _schemas) do
    quote do: String.t()
  end

  defp get_base_type(%Schema{type: "string", enum: enum}, _schemas) when is_list(enum) do
    # Convert enum values to a union type
    case enum do
      [] ->
        quote do: String.t()

      [single] ->
        quote do: unquote(String.to_atom(single))

      multiple ->
        # For multiple values, build the union type properly
        [first | rest] = Enum.map(multiple, &String.to_atom/1)

        Enum.reduce(rest, quote(do: unquote(first)), fn atom, acc ->
          quote do
            unquote(acc) | unquote(atom)
          end
        end)
    end
  end

  defp get_base_type(%Schema{type: "integer"}, _schemas) do
    quote do: integer()
  end

  defp get_base_type(%Schema{type: "number"}, _schemas) do
    quote do: number()
  end

  defp get_base_type(%Schema{type: "boolean"}, _schemas) do
    quote do: boolean()
  end

  defp get_base_type(%Schema{type: "array", items: items}, schemas) when not is_nil(items) do
    item_type = schema_to_typespec(items, schemas)

    quote do
      list(unquote(item_type))
    end
  end

  defp get_base_type(%Schema{type: "object", properties: nil}, _schemas) do
    # Generic object without specific properties
    quote do: map()
  end

  defp get_base_type(%Schema{type: "object", properties: properties}, _schemas)
       when is_map(properties) and map_size(properties) == 0 do
    quote do: map()
  end

  defp get_base_type(%Schema{type: "object", properties: properties, required: required}, schemas)
       when is_map(properties) do
    # Object with specific properties
    # Convert to struct-like typespec with required/optional keys
    required_list = required || []

    property_specs =
      properties
      |> Enum.map(fn {prop_name, prop_schema} ->
        prop_atom = String.to_atom(prop_name)
        prop_type = schema_to_typespec(prop_schema, schemas)

        if prop_name in required_list do
          # Required property
          quote do
            {required(unquote(prop_atom)), unquote(prop_type)}
          end
        else
          # Optional property
          quote do
            {optional(unquote(prop_atom)), unquote(prop_type)}
          end
        end
      end)

    # Build the map typespec
    quote do
      %{unquote_splicing(property_specs)}
    end
  end

  # Handle schemas with type: nil but oneOf set
  defp get_base_type(%Schema{type: nil, one_of: one_of}, schemas)
       when is_list(one_of) and one_of != [] do
    # Generate union type from all oneOf options
    types = Enum.map(one_of, &schema_to_typespec(&1, schemas))

    # Build union type
    case types do
      [single] ->
        single

      [first | rest] ->
        Enum.reduce(rest, first, fn type, acc ->
          quote do
            unquote(acc) | unquote(type)
          end
        end)
    end
  end

  # Handle schemas with type: nil but anyOf set
  defp get_base_type(%Schema{type: nil, any_of: any_of}, schemas)
       when is_list(any_of) and any_of != [] do
    # Generate union type from all anyOf options
    types = Enum.map(any_of, &schema_to_typespec(&1, schemas))

    # Build union type
    case types do
      [single] ->
        single

      [first | rest] ->
        Enum.reduce(rest, first, fn type, acc ->
          quote do
            unquote(acc) | unquote(type)
          end
        end)
    end
  end

  # Handle schemas with type: nil but allOf set
  defp get_base_type(%Schema{type: nil, all_of: all_of} = schema, schemas)
       when is_list(all_of) and all_of != [] do
    resolved_schema = SchemaResolver.resolve_schema(schema, schemas)

    cond do
      resolved_schema.all_of == nil ->
        get_base_type(resolved_schema, schemas)

      true ->
        quote do: any()
    end
  end

  # Handle schemas with type: nil but enum set
  defp get_base_type(%Schema{type: nil, enum: enum}, _schemas)
       when is_list(enum) and enum != [] do
    # Convert enum values to atom union type
    case enum do
      [single] ->
        quote do: unquote(String.to_atom(single))

      multiple ->
        [first | rest] = Enum.map(multiple, &String.to_atom/1)

        Enum.reduce(rest, quote(do: unquote(first)), fn atom, acc ->
          quote do
            unquote(acc) | unquote(atom)
          end
        end)
    end
  end

  # Handle references to component schemas
  defp get_base_type(%Schema{ref: "#/components/schemas/" <> component_name}, _schemas)
       when is_binary(component_name) do
    # Convert component name to module atom
    module = Module.concat([ExOpenAI, Components, String.to_atom(component_name)])

    # Generate a remote type reference
    quote do
      unquote(module).t()
    end
  end

  # Handle other reference patterns - fallback to any()
  defp get_base_type(%Schema{ref: ref}, _schemas) when is_binary(ref) do
    # TODO: Handle other reference patterns if needed
    quote do: any()
  end

  # Fallback for unhandled cases
  defp get_base_type(%Schema{}, _schemas) do
    quote do: any()
  end

  defp maybe_resolve_schema(%Schema{all_of: all_of} = schema, schemas)
       when is_list(all_of) and all_of != [] do
    SchemaResolver.resolve_schema(schema, schemas)
  end

  defp maybe_resolve_schema(schema, _schemas), do: schema
end
