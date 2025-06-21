defmodule ExOpenAI.Codegen.DocsParser.Schema do
  @moduledoc """
  Represents an OpenAPI schema component.
  """
  @type t :: %__MODULE__{
    name: String.t(),
    type: String.t() | nil,
    description: String.t() | nil,
    properties: %{String.t() => t()} | nil,
    required: [String.t()] | nil,
    enum: [any()] | nil,
    all_of: [t()] | nil,
    one_of: [t()] | nil,
    any_of: [t()] | nil,
    ref: String.t() | nil,
    format: String.t() | nil,
    items: t() | nil,
    additional_properties: boolean() | map() | nil,
    example: any() | nil,
    default: any() | nil,
    nullable: boolean() | nil,
    discriminator: map() | nil,
    read_only: boolean() | nil,
    write_only: boolean() | nil,
    deprecated: boolean() | nil,
    raw: map()
  }
  
  defstruct [
    :name,
    :type,
    :description,
    :properties,
    :required,
    :enum,
    :all_of,
    :one_of,
    :any_of,
    :ref,
    :format,
    :items,
    :additional_properties,
    :example,
    :default,
    :nullable,
    :discriminator,
    :read_only,
    :write_only,
    :deprecated,
    :raw
  ]

  @doc """
  Parses components section from OpenAPI specification.
  """
  @spec parse_components(map() | nil) :: %{String.t() => t()}
  def parse_components(nil), do: %{}
  def parse_components(components) do
    schemas = components["schemas"] || %{}
    
    Map.new(schemas, fn {name, schema_data} ->
      {name, parse_schema(name, schema_data)}
    end)
  end

  @doc """
  Parses a single schema definition.
  """
  @spec parse_schema(String.t(), map()) :: t()
  def parse_schema(name, data) when is_map(data) do
    %__MODULE__{
      name: name,
      type: data["type"],
      description: data["description"],
      properties: parse_properties(data["properties"]),
      required: data["required"],
      enum: data["enum"],
      all_of: parse_schema_array(data["allOf"]),
      one_of: parse_schema_array(data["oneOf"]),
      any_of: parse_schema_array(data["anyOf"]),
      ref: data["$ref"],
      format: data["format"],
      items: parse_items(data["items"]),
      additional_properties: data["additionalProperties"],
      example: data["example"],
      default: data["default"],
      nullable: data["nullable"],
      discriminator: data["discriminator"],
      read_only: data["readOnly"],
      write_only: data["writeOnly"],
      deprecated: data["deprecated"],
      raw: data
    }
  end

  # Parse properties recursively
  defp parse_properties(nil), do: nil
  defp parse_properties(properties) when is_map(properties) do
    Map.new(properties, fn {prop_name, prop_data} ->
      {prop_name, parse_schema(prop_name, prop_data)}
    end)
  end

  # Parse items (for array types)
  defp parse_items(nil), do: nil
  defp parse_items(items) when is_map(items) do
    parse_schema("items", items)
  end

  # Parse arrays of schemas (for allOf, oneOf, anyOf)
  defp parse_schema_array(nil), do: nil
  defp parse_schema_array(schemas) when is_list(schemas) do
    Enum.with_index(schemas, fn schema, index ->
      parse_schema("#{index}", schema)
    end)
  end
end