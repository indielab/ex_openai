defmodule ExOpenAI.Codegen.ResponseConverter do
  @moduledoc """
  Converts raw JSON API responses into Elixir structs based on the OpenAPI
  response schema and the generated component modules.

  At a high level this module:

  * Takes the decoded JSON response (string-keyed maps/lists from `Jason`)
  * Uses the response `Schema` to find the top-level response component
  * Uses the generated typespecs (`@type t() :: ...`) to understand field types
  * Builds the top-level response struct (e.g. `Response`, `CreateChatCompletionResponse`)
  * Recursively converts nested maps into component structs where the schema
    and typespecs provide enough information (including `anyOf`/`oneOf` unions)
  * Deep-atomizes keys for remaining nested maps/lists to keep ergonomics high

  This keeps the runtime behavior in sync with the generated typespecs under
  `ExOpenAI.Components.*`, including complex unions like `OutputItem.t/0`.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.TypespecGenerator

  @doc """
  Converts an API response into the expected struct type based on the response schema.

  Takes the response and the expected response schema, and converts the response
  into the expected top-level struct type if they match. Nested maps and lists
  are not converted into their own component structs; instead, their keys are
  recursively converted to atoms for easier access.

  ## Parameters

    * `response` - The API response tuple `{:ok, map}` or `{:error, any}`
    * `response_schema` - The Schema struct describing the expected response type

  ## Behavior Details

  * Handles responses with different patterns, including those with "response" and "type" keys
  * Processes reference values directly (when `is_reference(ref)` is true)
  * Converts responses to top-level component structs when the response schema is known
  * For `oneOf` and `anyOf` response schemas, selects the best matching component based on key overlap
  * Nested maps and lists are recursively converted to atom-keyed maps/lists, but are not wrapped
    into their own component structs
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

    # Try to extract the top-level typespec for the response struct
    return_type_spec =
      case response_type do
        {:__aliases__, _, module_parts} ->
          # Convert AST module reference to actual module atom
          module_name = Module.concat(module_parts)

          if module_exists?(module_name) do
            fetch_types(module_name)
          else
            []
          end

        {{:., [], [module, :t]}, [], []} ->
          # Handle typespec format like {{:., [], [ExOpenAI.Components.Response, :t]}, [], []}
          if module_exists?(module) do
            fetch_types(module)
          else
            []
          end

        module when is_atom(module) ->
          if module_exists?(module) do
            fetch_types(module)
          else
            []
          end

        _ ->
          []
      end

    case response do
      {:ok, ref} when is_reference(ref) ->
        {:ok, ref}

      {:ok, res} when is_map(res) ->
        # Check if we have a valid schema that would result in a struct
        has_valid_schema =
          case response_schema do
            %Schema{ref: "#/components/schemas/" <> component_name} ->
              module = ref_to_module(component_name)

              module_exists?(module) and
                count_matching_keys(res, get_struct_keys(module)) > 0

            %Schema{one_of: schemas} when is_list(schemas) and schemas != [] ->
              find_best_matching_schema(res, schemas) != nil

            %Schema{any_of: schemas} when is_list(schemas) and schemas != [] ->
              find_best_matching_schema(res, schemas) != nil

            _ ->
              false
          end

        if has_valid_schema and is_list(return_type_spec) do
          # Convert top-level fields using their typespecs. Nested maps/lists
          # may be further converted into component structs based on their
          # remote types and unions, or have their keys atomized when no more
          # specific information is available.
          converted_map =
            res
            |> Enum.map(fn {key, value} ->
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

              # Convert the value based on its type. When we have no type
              # information but the value is a map/list, atomize keys.
              converted_value =
                cond do
                  is_nil(field_type) and (is_map(value) or is_list(value)) ->
                    deep_atomize_keys(value)

                  true ->
                    parse_remote_type(field_type, value)
                end

              {atom_key, converted_value}
            end)
            |> Enum.into(%{})

          # Now create the struct for the top-level response
          case response_schema do
            %Schema{ref: "#/components/schemas/" <> component_name} ->
              module = ref_to_module(component_name)
              {:ok, struct(module, converted_map)}

            %Schema{one_of: _} ->
              convert_map_response(converted_map, response_schema)

            %Schema{any_of: _} ->
              convert_map_response(converted_map, response_schema)
          end
        else
          # No valid schema match or typespec, return original
          {:ok, res}
        end

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
        # Values are already converted, just create the struct
        {:ok, struct(module, res)}
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
      {module, _count, _component_name} ->
        # Values are already converted, just create the struct
        {:ok, struct(module, res)}

      nil ->
        {:ok, res}
    end
  end

  defp convert_map_response(res, %Schema{any_of: schemas})
       when is_list(schemas) and schemas != [] do
    # Handle anyOf - similar to oneOf
    best_match = find_best_matching_schema(res, schemas)

    case best_match do
      {module, _count, _component_name} ->
        # Values are already converted, just create the struct
        {:ok, struct(module, res)}

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

  # Check if a module is in the ExOpenAI.Components namespace.
  #
  # This is used to distinguish generated component modules from other remote
  # types (e.g. `String.t/0`) when we see a `:remote_type` in a typespec.
  defp component_module?(module) when is_atom(module) do
    module
    |> Atom.to_string()
    |> String.starts_with?("Elixir.ExOpenAI.Components.")
  end

  # Component alias modules define `@type t()` but no struct.
  #
  # Example: `OutputItem.t()` is a union of many component types, not a struct
  # by itself. We handle these by expanding their `t()` typespec and applying
  # the usual union logic, rather than trying to build a non-existent struct.
  defp component_alias?(module) when is_atom(module) do
    Code.ensure_loaded?(module) && not function_exported?(module, :__struct__, 0)
  end

  # Get the keys from a struct module
  defp get_struct_keys(module) do
    module.__struct__()
    |> Map.keys()
    |> Enum.filter(&(&1 != :__struct__))
  end

  defp fetch_types(module) do
    case Code.Typespec.fetch_types(module) do
      {:ok, specs} -> specs
      :error -> []
    end
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

  @doc """
  Parses a value based on its typespec.

  Handles primitive and enum-like fields, as well as remote component types and
  unions. For component modules, it can recursively convert nested maps to the
  appropriate structs based on the component's typespec and the shape of the
  data. Nested maps and lists are atomized recursively when no more specific
  type information is available.

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

  # Map types – recursively atomize keys and parse known fields
  def parse_remote_type({:type, _, :map, fields}, value) when is_map(value) do
    cond do
      is_list(fields) and fields == [] ->
        deep_atomize_keys(value)

      is_list(fields) ->
        base =
          Enum.reduce(fields, %{}, fn
            # Skip struct identity field
            {:type, _, :map_field_exact, [{:atom, _, :__struct__}, _]}, acc ->
              acc

            {:type, _, :map_field_assoc, [{:atom, _, :__struct__}, _]}, acc ->
              acc

            {:type, _, map_field_kind, [{:atom, _, key}, field_type]}, acc
            when map_field_kind in [:map_field_exact, :map_field_assoc] ->
              raw_val =
                case Map.fetch(value, key) do
                  {:ok, v} ->
                    v

                  :error ->
                    case Map.fetch(value, Atom.to_string(key)) do
                      {:ok, v} -> v
                      :error -> nil
                    end
                end

              Map.put(acc, key, parse_remote_type(field_type, raw_val))

            _, acc ->
              acc
          end)

        # Merge any remaining keys (atomized) without overriding parsed ones
        deep_atomize_keys(value)
        |> Enum.reduce(base, fn {k, v}, acc ->
          Map.put_new(acc, k, v)
        end)

      true ->
        deep_atomize_keys(value)
    end
  end

  def parse_remote_type({:type, _, :map, _}, value), do: value

  # Atom literals - only convert if the atom matches expected values
  def parse_remote_type({:atom, _, atom_value}, value) when is_binary(value) do
    # Only convert strings that match the expected atom
    if String.to_atom(value) == atom_value do
      atom_value
    else
      value
    end
  end

  def parse_remote_type({:atom, _, _atom_value}, value), do: value

  # Remote types – handle component modules (both struct modules and alias modules)
  # as well as basic remote types like String.t/0.
  def parse_remote_type(
        {:remote_type, _, [{:atom, _, module}, {:atom, _, :t}, []]},
        value
      ) do
    cond do
      # String.t() and similar – return as-is
      module == String ->
        value

      # Alias modules (like OutputItem) – expand their t() typespec and recurse
      component_module?(module) and component_alias?(module) and (is_map(value) or is_list(value)) ->
        case Code.Typespec.fetch_types(module) do
          {:ok, specs} ->
            case Keyword.get(specs, :type) do
              {:t, inner_type, []} ->
                parse_remote_type(inner_type, value)

              _ ->
                deep_atomize_keys(value)
            end

          :error ->
            deep_atomize_keys(value)
        end

      # Struct component modules – convert nested maps to component structs
      component_module?(module) and module_exists?(module) and is_map(value) ->
        component_name =
          module
          |> Atom.to_string()
          |> String.replace("Elixir.ExOpenAI.Components.", "")

        schema = %Schema{ref: "#/components/schemas/#{component_name}"}

        case convert_response({:ok, value}, schema) do
          {:ok, converted} -> converted
          _ -> deep_atomize_keys(value)
        end

      true ->
        value
    end
  end

  def parse_remote_type({:remote_type, _, _}, value), do: value

  # Union types – choose the best matching variant when possible.
  def parse_remote_type({:type, _, :union, types}, value) do
    flat_types = flatten_union_types(types)

    cond do
      value == nil and Enum.any?(flat_types, &match?({:atom, _, nil}, &1)) ->
        nil

      is_map(value) or is_list(value) ->
        pick_union_type(flat_types, value)

      true ->
        non_nil_type =
          Enum.find(flat_types, fn
            {:atom, _, nil} -> false
            _ -> true
          end)

        if non_nil_type, do: parse_remote_type(non_nil_type, value), else: value
    end
  end

  # List types
  def parse_remote_type({:type, _, :list, [element_type]}, value) when is_list(value) do
    Enum.map(value, &parse_remote_type(element_type, &1))
  end

  def parse_remote_type({:type, _, :list, _}, value), do: value

  # Catch-all for other type patterns
  def parse_remote_type(_type_spec, value), do: value

  # Atomize map/list keys (string -> atom) recursively for nested data
  defp atomize_keys(map) when is_map(map) do
    map
    |> Enum.map(fn
      {key, value} when is_binary(key) ->
        atom_key =
          try do
            String.to_existing_atom(key)
          rescue
            ArgumentError -> String.to_atom(key)
          end

        {atom_key, atomize_keys(value)}

      {key, value} ->
        {key, atomize_keys(value)}
    end)
    |> Enum.into(%{})
  end

  defp atomize_keys(list) when is_list(list), do: Enum.map(list, &atomize_keys/1)
  defp atomize_keys(value), do: value

  # Public helper for deeply atomizing nested maps/lists
  def deep_atomize_keys(map) when is_map(map), do: atomize_keys(map)
  def deep_atomize_keys(list) when is_list(list), do: Enum.map(list, &deep_atomize_keys/1)
  def deep_atomize_keys(value), do: value

  # Choose the best matching union type by key overlap and, when available, a
  # discriminator-like :type field inferred from the component typespec.
  defp pick_union_type(types, value) when is_map(value) do
    scored =
      Enum.map(types, fn
        # Remote component types
        {:remote_type, _, [{:atom, _, module}, {:atom, _, :t}, []]} = type ->
          if component_module?(module) and module_exists?(module) do
            specs = fetch_types(module)
            keys = get_struct_keys(module)
            base = count_matching_keys(value, keys)
            bonus = type_match_bonus(specs, value)
            {base + bonus, type}
          else
            {0, type}
          end

        # Map type – generic match for maps
        {:type, _, :map, _} = type ->
          {1, type}

        # List type – generic match for lists (handled in list clause)
        {:type, _, :list, _} = type ->
          {0, type}

        # Nil in union – handled separately
        {:atom, _, nil} = type when is_nil(value) ->
          {1, type}

        type ->
          {0, type}
      end)
      |> Enum.sort_by(fn {score, _type} -> score end, :desc)

    case scored do
      [{0, _} | _] ->
        # No good match; at least atomize keys to keep caller ergonomics
        deep_atomize_keys(value)

      [{_score, best_type} | _] ->
        parse_remote_type(best_type, value)

      _ ->
        deep_atomize_keys(value)
    end
  end

  defp pick_union_type(types, value) when is_list(value) do
    # Prefer list type when present
    list_type =
      Enum.find(types, fn
        {:type, _, :list, _} -> true
        _ -> false
      end)

    case list_type do
      nil -> value
      {:type, _, :list, [element_type]} -> Enum.map(value, &parse_remote_type(element_type, &1))
      _ -> value
    end
  end

  defp pick_union_type(_types, value), do: value

  # Compute a bonus score when a union variant's :type field matches the value's type.
  defp type_match_bonus(typespecs, value) do
    atomized = keys_to_atoms(value)

    case Map.fetch(atomized, :type) do
      :error ->
        0

      {:ok, v} ->
        val =
          cond do
            is_atom(v) -> Atom.to_string(v)
            is_binary(v) -> v
            true -> nil
          end

        case val do
          nil ->
            0

          type_string ->
            allowed = allowed_type_strings(typespecs, :type)
            if type_string in allowed, do: 10, else: 0
        end
    end
  end

  # Extract allowed string values for a given field's type from a typespec.
  defp allowed_type_strings(typespecs, field_name) do
    case get_field_type_from_ast(typespecs, field_name) do
      {:atom, _, atom} ->
        [Atom.to_string(atom)]

      {:type, _, :union, members} ->
        members
        |> Enum.flat_map(fn
          {:atom, _, atom} when atom != nil -> [Atom.to_string(atom)]
          _ -> []
        end)

      _ ->
        []
    end
  end

  # Flatten nested union types emitted by the compiler/typespec generator.
  defp flatten_union_types(types) when is_list(types) do
    Enum.flat_map(types, fn
      {:type, _, :union, inner} -> flatten_union_types(inner)
      other -> [other]
    end)
  end

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
