defmodule ExOpenAI.Codegen.DocsParser.Schema do
  @moduledoc """
  Represents an OpenAPI schema component.
  """
  @type t :: %__MODULE__{
    name: String.t(),
    type: String.t() | nil,
    description: String.t() | nil,
    properties: %{String.t() => map()} | nil,
    required: [String.t()] | nil,
    enum: [any()] | nil,
    all_of: [map()] | nil,
    one_of: [map()] | nil,
    any_of: [map()] | nil,
    ref: String.t() | nil,
    format: String.t() | nil,
    items: map() | nil,
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
      properties: data["properties"],
      required: data["required"],
      enum: data["enum"],
      all_of: data["allOf"],
      one_of: data["oneOf"],
      any_of: data["anyOf"],
      ref: data["$ref"],
      format: data["format"],
      items: data["items"],
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
end