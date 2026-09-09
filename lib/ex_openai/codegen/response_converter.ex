defmodule ExOpenAI.Codegen.ResponseConverter do
  @moduledoc """
  Converts API responses using generated component types and schema discriminators.

  Known fields use atom keys and typed structs. Dynamic objects, including metadata
  and JSON Schema properties, retain their original keys.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema

  @doc "Converts successful responses and preserves error tuples and async references."
  @spec convert_response({:ok, any()} | {:error, any()}, Schema.t() | nil) ::
          {:ok, any()} | {:error, any()}
  def convert_response(response, nil), do: response
  def convert_response({:error, _} = response, _schema), do: response
  def convert_response({:ok, ref} = response, _schema) when is_reference(ref), do: response

  def convert_response({:ok, value}, %Schema{ref: "#/components/schemas/" <> name}) do
    module = ref_to_module(name)

    cond do
      module_exists?(module) and is_map(value) ->
        keys = get_struct_keys(module)
        types = fetch_types(module)

        if keys == [] or count_matching_keys(value, keys) > 0 do
          fields =
            for key <- keys,
                {:ok, raw} <- [fetch_field(value, key)] do
              {key, parse_remote_type(get_field_type_from_ast(types, key), raw)}
            end

          {:ok, struct(module, fields)}
        else
          {:ok, value}
        end

      component_alias?(module) ->
        {:ok, parse_remote_type(component_type(module), value)}

      true ->
        {:ok, value}
    end
  end

  def convert_response({:ok, value}, %Schema{one_of: schemas, discriminator: discriminator})
      when is_list(schemas) and schemas != [] and is_map(value) do
    convert_map_union_response(value, schemas, discriminator)
  end

  def convert_response({:ok, value}, %Schema{any_of: schemas, discriminator: discriminator})
      when is_list(schemas) and schemas != [] and is_map(value) do
    convert_map_union_response(value, schemas, discriminator)
  end

  def convert_response({:ok, values}, %Schema{type: "array", items: %Schema{} = schema})
      when is_list(values) do
    {:ok,
     Enum.map(values, fn value ->
       {:ok, converted} = convert_response({:ok, value}, schema)
       converted
     end)}
  end

  def convert_response({:ok, value}, %Schema{properties: properties})
      when is_map(value) and is_map(properties) do
    converted =
      Enum.reduce(properties, value, fn {name, schema}, acc ->
        key = String.to_atom(name)

        case fetch_field(value, key) do
          {:ok, raw} ->
            {:ok, parsed} = convert_response({:ok, raw}, schema)
            acc |> Map.delete(name) |> Map.put(key, parsed)

          :error ->
            acc
        end
      end)

    {:ok, converted}
  end

  def convert_response({:ok, value}, %Schema{enum: values}) when is_list(values) do
    parsed = if is_binary(value) and value in values, do: String.to_atom(value), else: value
    {:ok, parsed}
  end

  def convert_response(response, %Schema{}), do: response

  defp fetch_field(value, key) do
    case Map.fetch(value, key) do
      :error -> Map.fetch(value, Atom.to_string(key))
      found -> found
    end
  end

  defp component_type(module) do
    Enum.find_value(fetch_types(module), fn
      {:type, {:t, type, []}} -> type
      _ -> nil
    end)
  end

  # Convert a `oneOf`/`anyOf` payload by first looking for the schema's
  # discriminator field and using that union tag to select the right branch.
  #
  # Example:
  #   discriminator.property_name == "type"
  #   payload["type"] == "response.output_text.delta"
  #
  # If there is no discriminator, or the discriminator value does not resolve
  # cleanly, we fall back to the older key-overlap heuristic.
  @spec convert_map_union_response(map(), [Schema.t()], map() | nil) ::
          {:ok, any()} | {:error, any()}
  defp convert_map_union_response(res, schemas, discriminator) do
    best_match = find_matching_schema(res, schemas, discriminator)

    case best_match do
      {_module, _count, component_name} ->
        convert_response({:ok, res}, %Schema{ref: "#/components/schemas/" <> component_name})

      nil ->
        {:ok, res}
    end
  end

  # Find the best matching schema from a list of schemas
  @spec find_matching_schema(map(), [Schema.t()], map() | nil) ::
          {module(), non_neg_integer(), String.t()} | nil
  defp find_matching_schema(res, schemas, discriminator) do
    find_discriminator_matching_schema(res, schemas, discriminator) ||
      find_best_matching_schema(res, schemas)
  end

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
    |> Enum.filter(fn
      {_module, count, _name} -> count > 0
      nil -> false
    end)
    |> Enum.sort_by(fn {_module, count, _name} -> count end, :desc)
    |> List.first()
  end

  # Use the schema discriminator to resolve an exact union arm for a payload.
  #
  # This is the preferred path for streamed event unions such as
  # `ResponseStreamEvent`, where a top-level field like:
  #
  #   "type": "response.output_text.delta"
  #
  # identifies the concrete event schema without any shape-guessing.
  @spec find_discriminator_matching_schema(map(), [Schema.t()], map() | nil) ::
          {module(), non_neg_integer(), String.t()} | nil
  defp find_discriminator_matching_schema(_res, _schemas, nil), do: nil

  defp find_discriminator_matching_schema(res, schemas, discriminator) when is_map(res) do
    with property_name when is_binary(property_name) <-
           discriminator_property_name(discriminator),
         raw_value when not is_nil(raw_value) <- fetch_discriminator_value(res, property_name),
         discriminator_value when is_binary(discriminator_value) <-
           normalize_discriminator_value(raw_value) do
      find_explicit_discriminator_match(discriminator, discriminator_value) ||
        find_inferred_discriminator_match(schemas, property_name, discriminator_value)
    else
      _ -> nil
    end
  end

  # Read the name of the union tag field from normalized discriminator
  # metadata, e.g. `"type"` or `"object"`.
  @spec discriminator_property_name(Schema.discriminator_t() | nil) :: String.t() | nil
  defp discriminator_property_name(discriminator) when is_map(discriminator) do
    discriminator[:property_name] || discriminator["property_name"] ||
      discriminator[:propertyName] || discriminator["propertyName"]
  end

  # Read the explicit discriminator mapping, if the schema provided one. The
  # mapping connects discriminator values to component refs, for example:
  #
  #   "response.output_text.delta" =>
  #     "#/components/schemas/ResponseTextDeltaEvent"
  @spec discriminator_mapping(Schema.discriminator_t()) :: Schema.discriminator_mapping_t()
  defp discriminator_mapping(discriminator) when is_map(discriminator) do
    discriminator[:mapping] || discriminator["mapping"] || %{}
  end

  # Fetch the discriminator tag value from the payload using either the raw JSON
  # string key (`"type"`) or the atomized equivalent (`:type`).
  @spec fetch_discriminator_value(map(), String.t()) :: any() | nil
  defp fetch_discriminator_value(res, property_name) when is_map(res) do
    case Map.fetch(res, property_name) do
      {:ok, value} ->
        value

      :error ->
        atom_key =
          try do
            String.to_existing_atom(property_name)
          rescue
            ArgumentError -> String.to_atom(property_name)
          end

        Map.get(res, atom_key)
    end
  end

  @spec normalize_discriminator_value(any()) :: String.t() | nil
  defp normalize_discriminator_value(value) when is_atom(value), do: Atom.to_string(value)
  defp normalize_discriminator_value(value) when is_binary(value), do: value
  defp normalize_discriminator_value(_), do: nil

  # Respect an explicit discriminator mapping from the schema when present.
  #
  # This is the most direct form of dispatch because the OpenAPI schema tells us
  # exactly which component ref to use for a given discriminator value.
  @spec find_explicit_discriminator_match(map(), String.t()) ::
          {module(), non_neg_integer(), String.t()} | nil
  defp find_explicit_discriminator_match(discriminator, discriminator_value) do
    case Map.get(discriminator_mapping(discriminator), discriminator_value) do
      "#/components/schemas/" <> component_name ->
        module = ref_to_module(component_name)

        if module_exists?(module) do
          {module, 10_000, component_name}
        end

      _ ->
        nil
    end
  end

  # Fall back to inferring the correct union arm from generated component
  # typespecs when the schema only gives us the discriminator field name and no
  # explicit mapping.
  #
  # Concretely, for a discriminator field like `type`, we inspect each
  # candidate component's `@type t()` and look for literal values such as:
  #
  #   type: :message
  #   type: :"response.output_text.delta"
  #
  # If one of those literals matches the payload's discriminator value, we use
  # that component.
  @spec find_inferred_discriminator_match([Schema.t()], String.t(), String.t()) ::
          {module(), non_neg_integer(), String.t()} | nil
  defp find_inferred_discriminator_match(schemas, property_name, discriminator_value) do
    field_name =
      try do
        String.to_existing_atom(property_name)
      rescue
        ArgumentError -> String.to_atom(property_name)
      end

    schemas
    |> Enum.find_value(fn
      %Schema{ref: "#/components/schemas/" <> component_name} ->
        module = ref_to_module(component_name)

        if module_exists?(module) do
          specs = fetch_types(module)

          if discriminator_value in allowed_type_strings(specs, field_name) do
            {module, 10_000, component_name}
          end
        end

      _ ->
        nil
    end)
  end

  # Convert a component name to its module atom
  defp ref_to_module(component_name) do
    String.to_existing_atom("Elixir.ExOpenAI.Components.#{component_name}")
  rescue
    ArgumentError -> nil
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
          ArgumentError -> {key, value}
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
  data. Dynamic maps retain their original keys when no more specific type
  information is available.

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
        value

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
              found =
                case Map.fetch(value, key) do
                  :error -> Map.fetch(value, Atom.to_string(key))
                  result -> result
                end

              case found do
                {:ok, raw} -> Map.put(acc, key, parse_remote_type(field_type, raw))
                :error -> acc
              end

            _, acc ->
              acc
          end)

        # Merge any remaining keys (atomized) without overriding parsed ones
        Enum.reduce(value, base, fn {key, raw}, acc ->
          known = Enum.find(Map.keys(base), &(key == &1 or key == Atom.to_string(&1)))
          if known, do: acc, else: Map.put(acc, key, raw)
        end)

      true ->
        value
    end
  end

  def parse_remote_type({:type, _, :map, _}, value), do: value

  # Atom literals - only convert if the atom matches expected values
  def parse_remote_type({:atom, _, atom_value}, value) when is_binary(value) do
    # Only convert strings that match the expected atom
    if value == Atom.to_string(atom_value) do
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

      component_module?(module) and component_alias?(module) ->
        parse_remote_type(component_type(module), value)

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
    types = expand_union_aliases(types, MapSet.new())

    if is_map(value) or is_list(value) do
      pick_union_type(types, value)
    else
      matching =
        Enum.find(types, fn
          {:atom, _, literal} ->
            value == literal or (is_binary(value) and value == Atom.to_string(literal))

          _ ->
            false
        end)

      accepts_string? =
        Enum.any?(types, fn
          {:remote_type, _, [{:atom, _, String}, {:atom, _, :t}, []]} -> true
          {:type, _, :binary, _} -> true
          _ -> false
        end)

      if not is_nil(matching) and not accepts_string?,
        do: parse_remote_type(matching, value),
        else: value
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
            ArgumentError -> key
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

        # Nil in union – handled by the nil branch above, so it gets no score here.
        {:atom, _, nil} = type ->
          {0, type}

        type ->
          {0, type}
      end)
      |> Enum.sort_by(fn {score, _type} -> score end, :desc)

    case scored do
      [{0, _} | _] ->
        value

      [{_score, best_type} | _] ->
        parse_remote_type(best_type, value)

      _ ->
        value
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

  defp expand_union_aliases(types, seen) do
    Enum.flat_map(types, fn
      {:type, _, :union, inner} ->
        expand_union_aliases(inner, seen)

      {:remote_type, _, [{:atom, _, module}, {:atom, _, :t}, []]} = type ->
        if component_module?(module) and component_alias?(module) and
             not MapSet.member?(seen, module) do
          expand_union_aliases([component_type(module)], MapSet.put(seen, module))
        else
          [type]
        end

      other ->
        [other]
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
    case Enum.find(typespec_ast, &match?({:type, {:t, _, []}}, &1)) do
      {:type, {:t, type_def, []}} ->
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
