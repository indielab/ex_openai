defmodule ExOpenAI.Codegen.TypespecGenerator do
  @moduledoc """
  Generates Elixir typespecs from OpenAPI Schema structs.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema

  @doc """
  Converts a Schema struct into an Elixir typespec AST.
  """
  @spec schema_to_typespec(Schema.t()) :: Macro.t()
  def schema_to_typespec(%Schema{} = schema) do
    base_type = get_base_type(schema)
    
    # Wrap in nullable if needed
    if schema.nullable do
      quote do
        unquote(base_type) | nil
      end
    else
      base_type
    end
  end

  # Get the base type without nullable wrapper
  defp get_base_type(%Schema{type: "string", enum: nil}) do
    quote do: String.t()
  end

  defp get_base_type(%Schema{type: "string", enum: enum}) when is_list(enum) do
    # Convert enum values to a union type
    case enum do
      [] -> quote do: String.t()
      [single] -> quote do: unquote(String.to_atom(single))
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

  defp get_base_type(%Schema{type: "integer"}) do
    quote do: integer()
  end

  defp get_base_type(%Schema{type: "number"}) do
    quote do: number()
  end

  defp get_base_type(%Schema{type: "boolean"}) do
    quote do: boolean()
  end

  defp get_base_type(%Schema{type: "array", items: items}) when not is_nil(items) do
    item_type = schema_to_typespec(items)
    quote do
      list(unquote(item_type))
    end
  end

  defp get_base_type(%Schema{type: "object", properties: nil}) do
    # Generic object without specific properties
    quote do: map()
  end

  defp get_base_type(%Schema{type: "object", properties: properties, required: required}) 
       when is_map(properties) do
    # Object with specific properties
    # Convert to struct-like typespec with required/optional keys
    required_list = required || []
    
    property_specs = 
      properties
      |> Enum.map(fn {prop_name, prop_schema} ->
        prop_atom = String.to_atom(prop_name)
        prop_type = schema_to_typespec(prop_schema)
        
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
  defp get_base_type(%Schema{type: nil, one_of: one_of}) when is_list(one_of) and one_of != [] do
    # Generate union type from all oneOf options
    types = Enum.map(one_of, &schema_to_typespec/1)
    
    # Build union type
    case types do
      [single] -> single
      [first | rest] ->
        Enum.reduce(rest, first, fn type, acc ->
          quote do
            unquote(acc) | unquote(type)
          end
        end)
    end
  end

  # Handle schemas with type: nil but anyOf set
  defp get_base_type(%Schema{type: nil, any_of: any_of}) when is_list(any_of) and any_of != [] do
    # Generate union type from all anyOf options
    types = Enum.map(any_of, &schema_to_typespec/1)
    
    # Build union type
    case types do
      [single] -> single
      [first | rest] ->
        Enum.reduce(rest, first, fn type, acc ->
          quote do
            unquote(acc) | unquote(type)
          end
        end)
    end
  end

  # Handle schemas with type: nil but allOf set
  defp get_base_type(%Schema{type: nil, all_of: all_of}) when is_list(all_of) and all_of != [] do
    # TODO: Implement proper allOf handling (intersection types)
    # For now, return any()
    quote do: any()
  end

  # Handle schemas with type: nil but enum set
  defp get_base_type(%Schema{type: nil, enum: enum}) when is_list(enum) and enum != [] do
    # Convert enum values to atom union type
    case enum do
      [single] -> quote do: unquote(String.to_atom(single))
      multiple ->
        [first | rest] = Enum.map(multiple, &String.to_atom/1)
        
        Enum.reduce(rest, quote(do: unquote(first)), fn atom, acc ->
          quote do
            unquote(acc) | unquote(atom)
          end
        end)
    end
  end

  # Handle references - for now just return any()
  defp get_base_type(%Schema{ref: ref}) when is_binary(ref) do
    # TODO: In the future, resolve the reference to the actual type
    quote do: any()
  end
  
  # Fallback for unhandled cases
  defp get_base_type(%Schema{}) do
    quote do: any()
  end
end