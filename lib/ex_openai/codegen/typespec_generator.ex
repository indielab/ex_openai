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

  @doc "Generates input types for structs, atom-keyed maps, and file uploads."
  def schema_to_input_typespec(%Schema{} = schema, schemas \\ %{}) do
    schema = maybe_resolve_schema(schema, schemas)
    type = input_type(schema, schemas)
    if schema.nullable, do: quote(do: unquote(type) | nil), else: type
  end

  defp input_type(%Schema{type: "string", format: "binary"}, _schemas) do
    quote do: binary() | {String.t(), binary()}
  end

  defp input_type(%Schema{ref: "#/components/schemas/" <> name}, _schemas) do
    module = Module.concat([ExOpenAI, Components, name])
    quote do: unquote(module).input()
  end

  defp input_type(%Schema{enum: enum} = schema, schemas) when is_list(enum) and enum != [] do
    type = schema_to_typespec(schema, schemas)
    if Enum.all?(enum, &is_binary/1), do: quote(do: unquote(type) | String.t()), else: type
  end

  defp input_type(%Schema{type: "array", items: %Schema{} = items}, schemas) do
    type = schema_to_input_typespec(items, schemas)
    quote do: list(unquote(type))
  end

  defp input_type(%Schema{properties: properties, required: required}, schemas)
       when is_map(properties) and map_size(properties) > 0 do
    fields =
      properties
      |> Enum.sort_by(&elem(&1, 0))
      |> Enum.map(fn {name, schema} ->
        key = String.to_atom(name)
        type = schema_to_input_typespec(schema, schemas)

        if name in (required || []) do
          quote do: {required(unquote(key)), unquote(type)}
        else
          quote do: {optional(unquote(key)), unquote(type)}
        end
      end)

    quote do: %{unquote_splicing(fields)}
  end

  defp input_type(%Schema{one_of: schemas}, components) when is_list(schemas) and schemas != [] do
    input_union(schemas, components)
  end

  defp input_type(%Schema{any_of: schemas}, components) when is_list(schemas) and schemas != [] do
    input_union(schemas, components)
  end

  defp input_type(schema, schemas), do: get_base_type(schema, schemas)

  defp input_union(schemas, components) do
    [first | rest] = Enum.map(schemas, &schema_to_input_typespec(&1, components))
    Enum.reduce(rest, first, fn type, acc -> quote(do: unquote(acc) | unquote(type)) end)
  end

  @doc "Renders a typespec as Markdown code without exposing its AST."
  def type_to_string(type) do
    type
    |> Macro.postwalk(fn
      {:|, _, types} ->
        [last | rest] = types |> flatten_union() |> Enum.reverse()
        Enum.reduce(rest, last, fn left, right -> {:|, [], [left, right]} end)

      other ->
        other
    end)
    |> Macro.to_string()
    |> String.replace(~r/\s+/, " ")
  end

  defp flatten_union(types) do
    Enum.flat_map(types, fn
      {:|, _, nested} -> flatten_union(nested)
      type -> [type]
    end)
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

  defp get_base_type(%Schema{type: "null"}, _schemas), do: nil

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

    if resolved_schema.all_of == nil do
      get_base_type(resolved_schema, schemas)
    else
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
