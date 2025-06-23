defmodule ExOpenAI.Codegen.ResponseConverter do
  @moduledoc """
  Converts API responses from maps to appropriate struct types based on the response schema.
  
  This module handles the conversion of JSON responses returned by the OpenAI API
  into the proper Elixir structs defined in the ExOpenAI.Components namespace.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema

  @doc """
  Converts an API response into the expected struct type based on the response schema.

  Takes the response and the expected response schema, and converts the response 
  into the expected type if they match. If no keys match, the response is returned 
  as is (as a map instead of a struct).

  ## Parameters

    * `response` - The API response tuple `{:ok, map}` or `{:error, any}`
    * `response_schema` - The Schema struct describing the expected response type

  ## Behavior Details

  * Handles responses with different patterns, including those with "response" and "type" keys
  * Processes reference types directly (when `is_reference(ref)` is true)
  * Converts responses to component structs when the response structure matches a component
  * Handles `oneOf` and `anyOf` type responses by finding the best matching component based on key matching
  * Uses a key-matching algorithm to determine the most appropriate struct to convert to
  * For components, counts how many keys in the response match the component's struct keys
  * For `oneOf`/`anyOf` types, tries each possible component and selects the one with the most matching keys
  * Returns the original response when no conversion is needed or possible
  * Preserves error tuples, passing them through unchanged

  ## Return Values

  * `{:ok, converted_value}` for successful conversions
  * Original error tuples are passed through unchanged
  """
  @spec convert_response({:ok, any()} | {:error, any()}, Schema.t() | nil) ::
          {:ok, any()} | {:error, any()}
  def convert_response({:ok, %{"response" => res, "type" => _t}}, response_schema) do
    convert_response({:ok, res}, response_schema)
  end

  def convert_response(response, nil), do: response

  def convert_response(response, %Schema{} = response_schema) do
    case response do
      {:ok, ref} when is_reference(ref) ->
        {:ok, ref}

      {:ok, res} when is_map(res) ->
        convert_map_response(res, response_schema)

      e ->
        e
    end
  end

  # Convert a map response based on the schema type
  defp convert_map_response(res, %Schema{ref: "#/components/schemas/" <> component_name}) do
    # Direct component reference
    module = ref_to_module(component_name)
    
    if module_exists?(module) do
      keys = get_struct_keys(module)
      matching_keys = count_matching_keys(res, keys)
      
      if matching_keys > 0 do
        # Convert to atoms and then to struct
        atomized = keys_to_atoms(res)
        converted = convert_values_for_struct(atomized, component_name)
        {:ok, struct(module, converted)}
      else
        {:ok, res}
      end
    else
      {:ok, res}
    end
  end

  defp convert_map_response(res, %Schema{one_of: schemas}) when is_list(schemas) and schemas != [] do
    # Handle oneOf - find the best matching schema
    best_match = find_best_matching_schema(res, schemas)
    
    case best_match do
      {module, _count, component_name} ->
        atomized = keys_to_atoms(res)
        converted = convert_values_for_struct(atomized, component_name)
        {:ok, struct(module, converted)}
      nil ->
        {:ok, res}
    end
  end

  defp convert_map_response(res, %Schema{any_of: schemas}) when is_list(schemas) and schemas != [] do
    # Handle anyOf - similar to oneOf
    best_match = find_best_matching_schema(res, schemas)
    
    case best_match do
      {module, _count, component_name} ->
        atomized = keys_to_atoms(res)
        converted = convert_values_for_struct(atomized, component_name)
        {:ok, struct(module, converted)}
      nil ->
        {:ok, res}
    end
  end

  defp convert_map_response(res, _schema) do
    # For other schema types, return as-is
    {:ok, res}
  end

  # Find the best matching schema from a list of schemas
  defp find_best_matching_schema(res, schemas) do
    schemas
    |> Enum.map(fn 
      %Schema{ref: "#/components/schemas/" <> component_name} ->
        module = ref_to_module(component_name)
        if module_exists?(module) do
          keys = get_struct_keys(module)
          count = count_matching_keys(res, keys)
          {module, count, component_name}
        else
          nil
        end
      _ ->
        nil
    end)
    |> Enum.filter(&(&1 != nil))
    |> Enum.filter(fn {_module, count, _name} -> count > 0 end)
    |> Enum.sort_by(fn {_module, count, _name} -> count end, :desc)
    |> List.first()
  end

  # Convert a component name to its module atom
  defp ref_to_module(component_name) do
    String.to_atom("Elixir.ExOpenAI.Components.#{component_name}")
  end

  # Check if a module exists and has a struct
  defp module_exists?(module) do
    Code.ensure_loaded?(module) && function_exported?(module, :__struct__, 0)
  end

  # Get the keys from a struct module
  defp get_struct_keys(module) do
    module.__struct__()
    |> Map.keys()
    |> Enum.filter(&(&1 != :__struct__))
  end

  # Count how many keys from the response match the struct keys
  defp count_matching_keys(res, struct_keys) do
    res
    |> keys_to_atoms()
    |> Map.keys()
    |> Enum.filter(&(&1 in struct_keys))
    |> length()
  end

  # Convert string keys to atom keys in a map
  defp keys_to_atoms(map) when is_map(map) do
    map
    |> Enum.map(fn
      {key, value} when is_binary(key) ->
        # Only convert to atom if it already exists
        try do
          {String.to_existing_atom(key), value}
        rescue
          ArgumentError -> {String.to_atom(key), value}
        end
      
      {key, value} ->
        {key, value}
    end)
    |> Enum.into(%{})
  end

  defp keys_to_atoms(value), do: value
  
  # Convert values based on expected types for specific struct fields
  defp convert_values_for_struct(map, component_name) do
    # For now, handle common conversions
    # In the future, this could use the actual schema information
    map
    |> Enum.map(fn {key, value} ->
      converted_value = case {component_name, key} do
        # Response component specific conversions
        {"Response", :object} when is_binary(value) -> 
          String.to_atom(value)
          
        {"Response", :status} when is_binary(value) -> 
          String.to_atom(value)
          
        # Don't convert other fields automatically
        _ -> 
          value
      end
      
      {key, converted_value}
    end)
    |> Enum.into(%{})
  end
end
