defmodule ExOpenAI.Codegen.ComponentModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Schema structs.
  """

  alias ExOpenAI.Codegen.DocsParser.Schema
  alias ExOpenAI.Codegen.TypespecGenerator

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

    # Generate moduledoc if description exists
    moduledoc =
      if schema.description do
        quote do
          @moduledoc unquote(schema.description)
        end
      else
        quote do
          @moduledoc "Module for representing the OpenAI schema #{unquote(name)}."
        end
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

    # Generate moduledoc if description exists
    moduledoc =
      if schema.description do
        quote do
          @moduledoc unquote(schema.description)
        end
      else
        quote do
          @moduledoc "Module for representing the OpenAI schema #{unquote(name)}."
        end
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
end
