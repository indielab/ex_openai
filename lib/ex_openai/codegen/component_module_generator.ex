defmodule ExOpenAI.Codegen.ComponentModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Schema structs.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.TypespecGenerator
  
  require Logger

  @doc """
  Generates an Elixir module from a Schema struct.

  Takes a parsed Schema and returns the AST for a module definition.
  """
  @spec generate_module(Schema.t()) :: Macro.t()
  def generate_module(%Schema{name: name, type: "object"} = schema) do
    module_name = String.to_atom("Elixir.ExOpenAI.Components.#{name}")

    # Note: typespec is generated differently for structs vs type aliases

    # Extract property names for the struct definition
    struct_fields = get_struct_fields(schema)

    # Generate comprehensive moduledoc with field documentation
    moduledoc_content = generate_comprehensive_moduledoc(schema)
    moduledoc = quote do
      @moduledoc unquote(moduledoc_content)
    end

    quote do
      defmodule unquote(module_name) do
        use ExOpenAI.Jason

        unquote(moduledoc)

        # Generate the full type spec manually since we need the map syntax
        unquote(generate_type_spec(schema))

        defstruct unquote(struct_fields)
      end
    end
  end

  # For non-object schemas, generate a simple module with just a type alias
  def generate_module(%Schema{name: name} = schema) do
    module_name = String.to_atom("Elixir.ExOpenAI.Components.#{name}")

    # Generate the typespec for the schema
    typespec_ast = TypespecGenerator.schema_to_typespec(schema)

    # Generate comprehensive moduledoc
    moduledoc_content = generate_comprehensive_moduledoc(schema)
    moduledoc = quote do
      @moduledoc unquote(moduledoc_content)
    end

    quote do
      defmodule unquote(module_name) do
        use ExOpenAI.Jason

        unquote(moduledoc)

        @type t() :: unquote(typespec_ast)
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
  defp generate_type_spec(%Schema{properties: nil}) do
    quote do
      @type t() :: %__MODULE__{}
    end
  end

  defp generate_type_spec(%Schema{properties: properties, required: required})
       when is_map(properties) do
    required_list = required || []

    # Build the fields for the struct type as a keyword list
    fields =
      properties
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map(fn {prop_name, prop_schema} ->
        prop_atom = String.to_atom(prop_name)
        prop_type = TypespecGenerator.schema_to_typespec(prop_schema)

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
  @spec generate_comprehensive_moduledoc(Schema.t()) :: String.t()
  def generate_comprehensive_moduledoc(%Schema{name: name, type: "object"} = schema) do
    description_part = 
      if schema.description do
        schema.description
      else
        "Module for representing the OpenAI schema #{name}."
      end
    
    fields_doc = generate_fields_documentation(schema)
    
    if fields_doc != "" do
      "#{description_part}\n\n#{fields_doc}"
    else
      description_part
    end
  end
  
  def generate_comprehensive_moduledoc(%Schema{name: name} = schema) do
    description_part = 
      if schema.description do
        schema.description
      else
        "Module for representing the OpenAI schema #{name}."
      end
      
    type_info = generate_type_info(schema)
    
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
  @spec generate_fields_documentation(Schema.t()) :: String.t()
  def generate_fields_documentation(%Schema{properties: nil}), do: ""
  
  def generate_fields_documentation(%Schema{properties: properties, required: required}) when is_map(properties) do
    required_list = required || []
    
    field_docs = 
      properties
      |> Enum.sort_by(fn {name, _} -> name end)
      |> Enum.map(fn {prop_name, prop_schema} ->
        generate_field_doc(prop_name, prop_schema, prop_name in required_list)
      end)
      |> Enum.join("\n\n")
    
    if field_docs != "" do
      "## Fields\n\n#{field_docs}"
    else
      ""
    end
  end
  
  def generate_fields_documentation(_), do: ""
  
  @spec generate_field_doc(String.t(), Schema.t(), boolean()) :: String.t()
  defp generate_field_doc(name, schema, is_required) do
    field_name = "`:#{name}`"
    requirement = if is_required, do: "**required**", else: "**optional**"
    
    # Generate the type string
    type_str = type_to_string(schema)
    
    # Build the field documentation
    parts = ["* #{field_name} - #{requirement} - `#{type_str}`"]
    
    # Add description if available
    parts = if schema.description do
      parts ++ ["  \n  #{String.trim(schema.description)}"]
    else
      parts
    end
    
    # Add enum values if present
    parts = if schema.enum && length(schema.enum) > 0 do
      enum_values = Enum.map(schema.enum, &"`#{inspect(&1)}`") |> Enum.join(", ")
      parts ++ ["  \n  Allowed values: #{enum_values}"]
    else
      parts
    end
    
    # Add default value if present
    parts = if Map.has_key?(schema.raw || %{}, "default") do
      default_value = Map.get(schema.raw, "default")
      parts ++ ["  \n  Default: `#{inspect(default_value)}`"]
    else
      parts
    end
    
    # Add format if present
    parts = if schema.format do
      parts ++ ["  \n  Format: `#{schema.format}`"]
    else
      parts
    end
    
    # Add constraints if present
    constraints = extract_constraints(schema)
    parts = if constraints != [] do
      constraint_str = Enum.join(constraints, ", ")
      parts ++ ["  \n  Constraints: #{constraint_str}"]
    else
      parts
    end
    
    Enum.join(parts)
  end
  
  @spec type_to_string(Schema.t()) :: String.t()
  defp type_to_string(schema) do
    # Try to generate a readable type string
    try do
      typespec_ast = TypespecGenerator.schema_to_typespec(schema)
      # Convert the AST to a string representation
      ast_to_type_string(typespec_ast)
    rescue
      _ -> 
        # Fallback to basic type info
        basic_type_string(schema)
    end
  end
  
  # Convert AST to readable type string
  defp ast_to_type_string({:|, _, types}) do
    types
    |> Enum.map(&ast_to_type_string/1)
    |> Enum.join(" | ")
  end
  
  defp ast_to_type_string({:__aliases__, _, parts}) do
    Enum.join(parts, ".")
  end
  
  defp ast_to_type_string({{:., _, [{:__aliases__, _, mod_parts}, :t]}, _, []}) do
    module_name = Enum.join(mod_parts, ".")
    "#{module_name}.t()"
  end
  
  defp ast_to_type_string({:., _, [{:__aliases__, _, mod_parts}, :t]}) do
    module_name = Enum.join(mod_parts, ".")
    "#{module_name}.t()"
  end
  
  defp ast_to_type_string({fun, _, []}) when is_atom(fun) do
    "#{fun}()"
  end
  
  defp ast_to_type_string({:{}, _, [:map, _]}) do
    "map()"
  end
  
  defp ast_to_type_string({:%, _, [{:__aliases__, _, parts}, {:%{}, _, _fields}]}) do
    module_name = Enum.join(parts, ".")
    "#{module_name}.t()"
  end
  
  defp ast_to_type_string({:list, _, [type]}) do
    "[#{ast_to_type_string(type)}]"
  end
  
  defp ast_to_type_string([{:|, _, _} = union]) do
    "[#{ast_to_type_string(union)}]"
  end
  
  defp ast_to_type_string([type]) do
    "[#{ast_to_type_string(type)}]"
  end
  
  defp ast_to_type_string(nil) do
    "nil"
  end
  
  # Handle atoms (like :user)
  defp ast_to_type_string(atom) when is_atom(atom) do
    inspect(atom)
  end
  
  defp ast_to_type_string(other) do
    # Fallback for complex types - try to make it more readable
    case other do
      {{:., _, _}, _, _} -> basic_type_string(%Schema{})
      _ -> inspect(other)
    end
  end
  
  # Generate basic type string from schema
  defp basic_type_string(%Schema{ref: "#/components/schemas/" <> name}) do
    "ExOpenAI.Components.#{name}.t()"
  end
  
  defp basic_type_string(%Schema{type: type, nullable: true}) when is_binary(type) do
    "#{type}() | nil"
  end
  
  defp basic_type_string(%Schema{type: type}) when is_binary(type) do
    "#{type}()"
  end
  
  defp basic_type_string(%Schema{one_of: types}) when is_list(types) and types != [] do
    types
    |> Enum.map(&basic_type_string/1)
    |> Enum.join(" | ")
  end
  
  defp basic_type_string(%Schema{any_of: types}) when is_list(types) and types != [] do
    types
    |> Enum.map(&basic_type_string/1)
    |> Enum.join(" | ")
  end
  
  defp basic_type_string(%Schema{type: "array", items: items}) when not is_nil(items) do
    "[#{basic_type_string(items)}]"
  end
  
  defp basic_type_string(_) do
    "any()"
  end
  
  @spec extract_constraints(Schema.t()) :: [String.t()]
  defp extract_constraints(schema) do
    constraints = []
    raw = schema.raw || %{}
    
    # Add numeric constraints
    constraints = if Map.has_key?(raw, "minimum"), do: constraints ++ ["minimum: #{raw["minimum"]}"], else: constraints
    constraints = if Map.has_key?(raw, "maximum"), do: constraints ++ ["maximum: #{raw["maximum"]}"], else: constraints
    
    # Add string constraints
    constraints = if Map.has_key?(raw, "minLength"), do: constraints ++ ["minLength: #{raw["minLength"]}"], else: constraints
    constraints = if Map.has_key?(raw, "maxLength"), do: constraints ++ ["maxLength: #{raw["maxLength"]}"], else: constraints
    constraints = if Map.has_key?(raw, "pattern"), do: constraints ++ ["pattern: #{inspect(raw["pattern"])}"], else: constraints
    
    # Add array constraints
    constraints = if Map.has_key?(raw, "minItems"), do: constraints ++ ["minItems: #{raw["minItems"]}"], else: constraints
    constraints = if Map.has_key?(raw, "maxItems"), do: constraints ++ ["maxItems: #{raw["maxItems"]}"], else: constraints
    
    constraints
  end
  
  @spec generate_type_info(Schema.t()) :: String.t()
  defp generate_type_info(schema) do
    sections = []
    
    # Add type information
    type_str = type_to_string(schema)
    sections = sections ++ ["## Type\n\n`#{type_str}`"]
    
    # Add enum values if present
    sections = if schema.enum && length(schema.enum) > 0 do
      enum_values = Enum.map(schema.enum, &"`#{inspect(&1)}`") |> Enum.join(", ")
      sections ++ ["## Allowed Values\n\n#{enum_values}"]
    else
      sections
    end
    
    # Add constraints
    constraints = extract_constraints(schema)
    sections = if constraints != [] do
      constraint_str = Enum.join(constraints, "\n* ")
      sections ++ ["## Constraints\n\n* #{constraint_str}"]
    else
      sections
    end
    
    Enum.join(sections, "\n\n")
  end
end
