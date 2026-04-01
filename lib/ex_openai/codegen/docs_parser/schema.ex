defmodule ExOpenAI.Codegen.DocsParser.Schema do
  @moduledoc """
  Represents an OpenAPI schema component.
  """
  @type discriminator_mapping_t :: %{optional(String.t()) => String.t()}

  @type discriminator_t :: %{
          property_name: String.t() | nil,
          mapping: discriminator_mapping_t()
        }

  @type t :: %__MODULE__{
          name: String.t() | nil,
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
          discriminator: discriminator_t() | nil,
          read_only: boolean() | nil,
          write_only: boolean() | nil,
          deprecated: boolean() | nil,
          raw: map() | nil
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
      discriminator: normalize_discriminator(data["discriminator"]),
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

  # Normalize the OpenAPI "discriminator" for union schemas.
  #
  # In OpenAPI, a discriminator tells us which field on a payload identifies
  # the active branch of a `oneOf`/`anyOf` union. For example, a streaming
  # response union may say:
  #
  #   discriminator:
  #     propertyName: type
  #
  # and then individual payloads carry values like
  # `"type": "response.output_text.delta"`.
  #
  # We normalize that metadata into a stable internal shape:
  #
  #   %{property_name: "type", mapping: %{...}}
  #
  # so runtime conversion can dispatch directly from the tag field instead of
  # guessing by key overlap.
  @spec normalize_discriminator(map() | nil | any()) :: discriminator_t() | nil | any()
  defp normalize_discriminator(nil), do: nil

  defp normalize_discriminator(discriminator) when is_map(discriminator) do
    %{
      property_name:
        discriminator["propertyName"] || discriminator[:propertyName] ||
          discriminator[:property_name],
      mapping:
        normalize_discriminator_mapping(discriminator["mapping"] || discriminator[:mapping])
    }
  end

  defp normalize_discriminator(other), do: other

  # Normalize explicit discriminator mappings such as:
  #
  #   "response.output_text.delta" => "#/components/schemas/ResponseTextDeltaEvent"
  #
  # into a string-keyed map. Decoded JSON discriminator values are strings, so
  # keeping these keys as strings avoids another conversion step later.
  @spec normalize_discriminator_mapping(map() | nil) :: discriminator_mapping_t()
  defp normalize_discriminator_mapping(nil), do: %{}

  defp normalize_discriminator_mapping(mapping) when is_map(mapping) do
    Map.new(mapping, fn {key, value} -> {to_string(key), value} end)
  end
end
