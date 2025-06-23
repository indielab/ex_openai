defmodule ExOpenAI.Codegen.ResponseConverter do
  @moduledoc """
  Converts API responses from maps to appropriate struct types based on the response schema.

  This module handles the conversion of JSON responses returned by the OpenAI API
  into the proper Elixir structs defined in the ExOpenAI.Components namespace.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.TypespecGenerator

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
    response_type = TypespecGenerator.schema_to_typespec(response_schema)

    # Try to extract struct keys from the response_type if it's a module reference
    return_type_spec =
      case response_type do
        {:__aliases__, _, module_parts} ->
          # Convert AST module reference to actual module atom
          module_name = Module.concat(module_parts)

          if module_exists?(module_name) do
            {:ok, specs} = Code.Typespec.fetch_types(module_name)
            specs
          else
            []
          end

        {{:., [], [module, :t]}, [], []} ->
          # Handle typespec format like {{:., [], [ExOpenAI.Components.Response, :t]}, [], []}
          if module_exists?(module) do
            {:ok, specs} = Code.Typespec.fetch_types(module)
            specs
          else
            []
          end

        module when is_atom(module) ->
          if module_exists?(module) do
            {:ok, specs} = Code.Typespec.fetch_types(module)
            specs
          else
            []
          end

        _ ->
          []
      end

    # walk through all of the keys of response, and see if we can get the type for it with extract_field_from_type_def
    # Walk through all keys of the response map and extract their types
    case response do
      {:ok, res} when is_map(res) ->
        field_types =
          res
          |> Map.keys()
          |> Enum.map(fn key ->
            # Convert string key to atom for lookup
            atom_key =
              if is_binary(key) do
                try do
                  String.to_existing_atom(key)
                rescue
                  ArgumentError -> String.to_atom(key)
                end
              else
                key
              end

            # Extract type for this field from the typespec
            field_type = get_field_type_from_ast(return_type_spec, atom_key)

            IO.puts("Found type for #{inspect(atom_key)} -- #{inspect(field_type)}")

            {atom_key, field_type}
          end)
          |> Enum.into(%{})

        IO.inspect(field_types, label: "Field Types")

      _ ->
        nil
    end

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

  defp convert_map_response(res, %Schema{one_of: schemas})
       when is_list(schemas) and schemas != [] do
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

  defp convert_map_response(res, %Schema{any_of: schemas})
       when is_list(schemas) and schemas != [] do
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
      converted_value =
        case {component_name, key} do
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

  @doc """
  Parses a value based on its typespec, converting nested maps to structs when needed.

  Takes a typespec AST and a value, then converts the value appropriately based on the type.
  For remote types that reference component modules, it recursively converts nested maps to structs.

  ## Parameters

    * `type_spec` - The typespec AST for the field
    * `value` - The actual value to parse

  ## Returns

    * The parsed/converted value

  ## Examples

      iex> parse_remote_type({:type, 1, :boolean, []}, true)
      true

      iex> parse_remote_type({:remote_type, 1, [{:atom, 0, ExOpenAI.Components.Reasoning}, {:atom, 0, :t}, []]}, %{"effort" => nil})
      %ExOpenAI.Components.Reasoning{effort: nil}

  """
  def parse_remote_type(type_spec, value)

  # Handle nil values
  def parse_remote_type(_type_spec, nil), do: nil

  # Basic types - return as-is
  def parse_remote_type({:type, _, :boolean, []}, value), do: value
  def parse_remote_type({:type, _, :number, []}, value), do: value
  def parse_remote_type({:type, _, :integer, []}, value), do: value
  def parse_remote_type({:type, _, :binary, []}, value), do: value
  def parse_remote_type({:type, _, :string, []}, value), do: value
  def parse_remote_type({:type, _, :map, _}, value), do: value

  # Atom literals
  def parse_remote_type({:atom, _, _atom_value}, value) when is_binary(value) do
    String.to_atom(value)
  end
  def parse_remote_type({:atom, _, _atom_value}, value), do: value

  # Remote types
  def parse_remote_type({:remote_type, _, [{:atom, _, module}, {:atom, _, :t}, []]}, value) when is_map(value) do
    cond do
      # String.t is just a string, return as-is
      module == String ->
        value

      # Check if it's a component module
      module |> Atom.to_string() |> String.starts_with?("Elixir.ExOpenAI.Components.") ->
        # Extract component name from module
        component_name = module |> Atom.to_string() |> String.replace("Elixir.ExOpenAI.Components.", "")
        schema = %Schema{ref: "#/components/schemas/#{component_name}"}
        
        # Recursively convert the nested map
        case convert_response({:ok, value}, schema) do
          {:ok, converted} -> converted
          _ -> value
        end

      # Other remote types, return as-is
      true ->
        value
    end
  end
  def parse_remote_type({:remote_type, _, _}, value), do: value

  # Union types
  def parse_remote_type({:type, _, :union, types}, value) do
    # For unions, we need to try to match the value
    # First check if value is nil and nil is allowed
    if value == nil and Enum.any?(types, &match?({:atom, _, nil}, &1)) do
      nil
    else
      # Try to find the best matching type
      # For now, just try the first non-nil type
      non_nil_type = Enum.find(types, fn
        {:atom, _, nil} -> false
        _ -> true
      end)

      if non_nil_type do
        parse_remote_type(non_nil_type, value)
      else
        value
      end
    end
  end

  # List types
  def parse_remote_type({:type, _, :list, [element_type]}, value) when is_list(value) do
    Enum.map(value, &parse_remote_type(element_type, &1))
  end
  def parse_remote_type({:type, _, :list, _}, value), do: value

  # Catch-all for other type patterns
  def parse_remote_type(_type_spec, value), do: value

  @doc """
  Extracts the type definition for a specific field from a typespec AST.

  Takes a typespec AST (typically from Code.Typespec.fetch_types/1) and a field name,
  then searches through the AST structure to find the type definition for that field.

  ## Parameters

    * `typespec_ast` - The typespec AST structure, typically a list containing type definitions
    * `field_name` - The atom name of the field to look up

  ## Returns

    * The type AST for the field if found
    * `nil` if the field is not found in the typespec

  ## Examples

      iex> ast = [type: {:t, {:type, 1, :map, [...]}, []}]
      iex> get_field_type_from_ast(ast, :id)
      {:remote_type, 1, [{:atom, 0, String}, {:atom, 0, :t}, []]}

  """
  @spec get_field_type_from_ast(list(), atom()) :: any() | nil
  def get_field_type_from_ast(typespec_ast, field_name) when is_list(typespec_ast) do
    # Look for the :t type definition in the AST
    case Keyword.get(typespec_ast, :type) do
      {:t, type_def, []} ->
        extract_field_from_type_def(type_def, field_name)

      _ ->
        nil
    end
  end

  def get_field_type_from_ast(_, _), do: nil

  # Extract a specific field type from a type definition
  defp extract_field_from_type_def({:type, _line, :map, fields}, field_name) do
    # Search through map fields for the target field
    Enum.find_value(fields, fn
      {:type, _, :map_field_exact, [{:atom, _, ^field_name}, field_type]} ->
        field_type

      _ ->
        nil
    end)
  end

  defp extract_field_from_type_def(_, _), do: nil
end
