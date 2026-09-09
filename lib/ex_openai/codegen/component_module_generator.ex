defmodule ExOpenAI.Codegen.ComponentModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Schema structs.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.{SchemaResolver, TypespecGenerator}

  @doc """
  Generates an Elixir module from a Schema struct.

  Takes a parsed Schema and returns the AST for a module definition.
  For allOf schemas, it first resolves/merges them before checking if they're objects.
  """
  @spec generate_module(Schema.t(), %{String.t() => Schema.t()}) :: Macro.t()
  def generate_module(%Schema{name: name} = schema, schemas \\ %{}) do
    # First resolve the schema - this handles allOf merging
    resolved_schema = SchemaResolver.resolve_schema(schema, schemas)

    # Keep the original name from the input schema
    resolved_schema = %{resolved_schema | name: name}

    # Decide whether this schema should become a struct module or a simple
    # type alias:
    #
    # * Explicit `type: "object"` schemas are always treated as structs,
    #   even when `properties` is an empty map (we generate `defstruct []`).
    # * Schemas that omit `type: "object"` but define `properties` are also
    #   treated as objects – this fixes cases in the official docs where the
    #   `type` field is missing but an object shape is clearly described.
    # * Everything else (enums, unions, bare arrays, map‑like schemas with
    #   only `additionalProperties`, etc.) becomes a type alias.
    has_properties = is_map(resolved_schema.properties)
    property_count = if has_properties, do: map_size(resolved_schema.properties), else: 0

    cond do
      resolved_schema.type == "object" and has_properties ->
        generate_object_module(resolved_schema, schemas)

      is_nil(resolved_schema.type) and has_properties and property_count > 0 ->
        generate_object_module(resolved_schema, schemas)

      true ->
        generate_type_alias_module(resolved_schema, schemas)
    end
  end

  # Generate module for object-type schemas (with struct and from_json)
  defp generate_object_module(%Schema{name: name} = schema, schemas) do
    module_name = String.to_atom("Elixir.ExOpenAI.Components.#{name}")

    # Extract property names for the struct definition
    struct_fields = get_struct_fields(schema)

    # Generate comprehensive moduledoc with field documentation
    moduledoc_content = generate_comprehensive_moduledoc(schema, schemas)

    moduledoc =
      quote do
        @moduledoc unquote(moduledoc_content)
      end

    quote do
      defmodule unquote(module_name) do
        use ExOpenAI.Jason

        unquote(moduledoc)

        # Generate the full type spec manually since we need the map syntax
        unquote(generate_type_spec(schema, schemas))

        @typedoc "Accepted struct or atom-keyed input map."
        @type input() ::
                t() | unquote(TypespecGenerator.schema_to_input_typespec(schema, schemas))

        defstruct unquote(struct_fields)
      end
    end
  end

  # For non-object schemas, generate a simple module with just a type alias
  defp generate_type_alias_module(%Schema{name: name} = schema, schemas) do
    module_name = String.to_atom("Elixir.ExOpenAI.Components.#{name}")

    # Generate the typespec for the schema
    typespec_ast = TypespecGenerator.schema_to_typespec(schema, schemas)

    # Generate comprehensive moduledoc
    moduledoc_content = generate_comprehensive_moduledoc(schema, schemas)

    moduledoc =
      quote do
        @moduledoc unquote(moduledoc_content)
      end

    quote do
      defmodule unquote(module_name) do
        unquote(moduledoc)

        @type t() :: unquote(typespec_ast)
        @type input() :: unquote(TypespecGenerator.schema_to_input_typespec(schema, schemas))
      end
    end
  end

  # Extract field names from schema properties
  defp get_struct_fields(%Schema{properties: nil}), do: []

  defp get_struct_fields(%Schema{properties: properties}) when is_map(properties) do
    properties
    |> Map.keys()
    |> Enum.map(&String.to_atom/1)
    |> Enum.sort()
  end

  # Generate the complete @type t() spec
  defp generate_type_spec(%Schema{properties: nil}, _schemas) do
    quote do
      @type t() :: %__MODULE__{}
    end
  end

  defp generate_type_spec(%Schema{properties: properties, required: required}, schemas)
       when is_map(properties) do
    required_list = required || []

    # Build the fields for the struct type as a keyword list
    fields =
      properties
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map(fn {prop_name, prop_schema} ->
        prop_atom = String.to_atom(prop_name)
        prop_type = TypespecGenerator.schema_to_typespec(prop_schema, schemas)

        # For struct type definition, we need to handle nullability
        # If not required, the type should include nil
        type_ast =
          if prop_name in required_list do
            prop_type
          else
            # Add | nil if not already nullable
            if prop_schema.nullable do
              prop_type
            else
              quote do
                unquote(prop_type) | nil
              end
            end
          end

        {prop_atom, type_ast}
      end)

    # Build the struct type map AST manually
    struct_ast = {:%{}, [], [{:__struct__, {:__MODULE__, [], Elixir}} | fields]}

    quote do
      @type t() :: unquote(struct_ast)
    end
  end

  @doc """
  Generates comprehensive module documentation including field descriptions.

  For object schemas, this includes a fields section with details about each property.
  For non-object schemas, this provides type information.
  """
  @spec generate_comprehensive_moduledoc(Schema.t(), %{optional(String.t()) => Schema.t()}) ::
          String.t()
  def generate_comprehensive_moduledoc(%Schema{} = schema),
    do: generate_comprehensive_moduledoc(schema, %{})

  def generate_comprehensive_moduledoc(%Schema{name: name, type: "object"} = schema, schemas) do
    description_part =
      if schema.description do
        schema.description
      else
        "Module for representing the OpenAI schema #{name}."
      end

    fields_doc = generate_fields_documentation(schema, schemas)

    if fields_doc != "" do
      "#{description_part}\n\n#{fields_doc}"
    else
      description_part
    end
  end

  def generate_comprehensive_moduledoc(%Schema{name: name} = schema, schemas) do
    description_part =
      if schema.description do
        schema.description
      else
        "Module for representing the OpenAI schema #{name}."
      end

    type_info = generate_type_info(schema, schemas)

    if type_info != "" do
      "#{description_part}\n\n#{type_info}"
    else
      description_part
    end
  end

  @doc """
  Generates documentation for all fields in an object schema.

  Returns a formatted string with field names, types, requirements, and descriptions.
  """
  @spec generate_fields_documentation(Schema.t(), %{optional(String.t()) => Schema.t()}) ::
          String.t()
  def generate_fields_documentation(%Schema{properties: nil}, _schemas), do: ""

  def generate_fields_documentation(%Schema{properties: properties, required: required}, schemas)
      when is_map(properties) do
    required_list = required || []

    field_docs =
      properties
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map_join("\n\n", fn {prop_name, prop_schema} ->
        generate_field_doc(prop_name, prop_schema, prop_name in required_list, schemas)
      end)

    if field_docs != "" do
      "## Fields\n\n#{field_docs}"
    else
      ""
    end
  end

  def generate_fields_documentation(_, _schemas), do: ""

  @spec generate_field_doc(String.t(), Schema.t(), boolean(), %{
          optional(String.t()) => Schema.t()
        }) ::
          String.t()
  defp generate_field_doc(name, schema, is_required, schemas) do
    field_name = "`:#{name}`"
    requirement = if is_required, do: "**required**", else: "**optional**"

    # Generate the type string
    type_str = type_to_string(schema, schemas)

    # Build the field documentation
    parts = ["* #{field_name} - #{requirement} - `#{type_str}`"]

    # Add description if available
    parts =
      if schema.description do
        parts ++ ["  \n  #{String.trim(schema.description)}"]
      else
        parts
      end

    # Add enum values if present
    parts =
      if schema.enum && schema.enum != [] do
        enum_values = Enum.map_join(schema.enum, ", ", &"`#{inspect(&1)}`")
        parts ++ ["  \n  Allowed values: #{enum_values}"]
      else
        parts
      end

    # Add default value if present
    parts =
      if Map.has_key?(schema.raw || %{}, "default") do
        default_value = Map.get(schema.raw, "default")
        parts ++ ["  \n  Default: `#{inspect(default_value)}`"]
      else
        parts
      end

    # Add format if present
    parts =
      if schema.format do
        parts ++ ["  \n  Format: `#{schema.format}`"]
      else
        parts
      end

    # Add constraints if present
    constraints = extract_constraints(schema)

    parts =
      if constraints != [] do
        constraint_str = Enum.join(constraints, ", ")
        parts ++ ["  \n  Constraints: #{constraint_str}"]
      else
        parts
      end

    Enum.join(parts)
  end

  @spec type_to_string(Schema.t(), %{optional(String.t()) => Schema.t()}) :: String.t()
  defp type_to_string(schema, schemas) do
    schema
    |> TypespecGenerator.schema_to_typespec(schemas)
    |> TypespecGenerator.type_to_string()
  end

  @spec extract_constraints(Schema.t()) :: [String.t()]
  defp extract_constraints(schema) do
    constraints = []
    raw = schema.raw || %{}

    # Add numeric constraints
    constraints =
      if Map.has_key?(raw, "minimum"),
        do: constraints ++ ["minimum: #{raw["minimum"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maximum"),
        do: constraints ++ ["maximum: #{raw["maximum"]}"],
        else: constraints

    # Add string constraints
    constraints =
      if Map.has_key?(raw, "minLength"),
        do: constraints ++ ["minLength: #{raw["minLength"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maxLength"),
        do: constraints ++ ["maxLength: #{raw["maxLength"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "pattern"),
        do: constraints ++ ["pattern: #{inspect(raw["pattern"])}"],
        else: constraints

    # Add array constraints
    constraints =
      if Map.has_key?(raw, "minItems"),
        do: constraints ++ ["minItems: #{raw["minItems"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maxItems"),
        do: constraints ++ ["maxItems: #{raw["maxItems"]}"],
        else: constraints

    constraints
  end

  @spec generate_type_info(Schema.t(), %{optional(String.t()) => Schema.t()}) :: String.t()
  defp generate_type_info(schema, schemas) do
    sections = []

    # Add type information
    type_str = type_to_string(schema, schemas)
    sections = sections ++ ["## Type\n\n`#{type_str}`"]

    # Add enum values if present
    sections =
      if schema.enum && schema.enum != [] do
        enum_values = Enum.map_join(schema.enum, ", ", &"`#{inspect(&1)}`")
        sections ++ ["## Allowed Values\n\n#{enum_values}"]
      else
        sections
      end

    # Add constraints
    constraints = extract_constraints(schema)

    sections =
      if constraints != [] do
        constraint_str = Enum.join(constraints, "\n* ")
        sections ++ ["## Constraints\n\n* #{constraint_str}"]
      else
        sections
      end

    Enum.join(sections, "\n\n")
  end
end
