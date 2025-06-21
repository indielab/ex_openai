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

  defp get_base_type(%Schema{type: "object", properties: properties, required: _required}) 
       when is_map(properties) do
    # Object with specific properties
    # For now, return a simple map - we'll enhance this later
    quote do: map()
  end

  # Fallback for unhandled cases
  defp get_base_type(%Schema{}) do
    quote do: any()
  end
end