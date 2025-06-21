defmodule ExOpenAI.Codegen.DocsParser do
  @moduledoc """
  Parser for OpenAPI YAML documentation.
  
  Provides typed structs for components and paths to improve visibility
  and type safety when working with the OpenAPI specification.
  """

  defmodule Schema do
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
  end

  defmodule Parameter do
    @moduledoc """
    Represents an OpenAPI parameter.
    """
    @type t :: %__MODULE__{
      name: String.t(),
      in: String.t(),
      description: String.t() | nil,
      required: boolean(),
      schema: map() | nil,
      deprecated: boolean() | nil,
      allow_empty_value: boolean() | nil,
      style: String.t() | nil,
      explode: boolean() | nil,
      allow_reserved: boolean() | nil,
      example: any() | nil,
      examples: map() | nil
    }
    
    defstruct [
      :name,
      :in,
      :description,
      :schema,
      :deprecated,
      :allow_empty_value,
      :style,
      :explode,
      :allow_reserved,
      :example,
      :examples,
      required: false
    ]
  end

  defmodule RequestBody do
    @moduledoc """
    Represents an OpenAPI request body.
    """
    @type t :: %__MODULE__{
      description: String.t() | nil,
      required: boolean(),
      content: %{String.t() => map()}
    }
    
    defstruct [
      :description,
      content: %{},
      required: false
    ]
  end

  defmodule Response do
    @moduledoc """
    Represents an OpenAPI response.
    """
    @type t :: %__MODULE__{
      status_code: String.t(),
      description: String.t(),
      content: %{String.t() => map()} | nil,
      headers: %{String.t() => map()} | nil,
      links: %{String.t() => map()} | nil
    }
    
    defstruct [
      :status_code,
      :description,
      :content,
      :headers,
      :links
    ]
  end

  defmodule Operation do
    @moduledoc """
    Represents an OpenAPI operation (HTTP method handler).
    """
    @type t :: %__MODULE__{
      method: String.t(),
      operation_id: String.t() | nil,
      summary: String.t() | nil,
      description: String.t() | nil,
      tags: [String.t()] | nil,
      parameters: [Parameter.t()] | nil,
      request_body: RequestBody.t() | nil,
      responses: %{String.t() => Response.t()},
      deprecated: boolean() | nil,
      security: [map()] | nil,
      servers: [map()] | nil,
      external_docs: map() | nil,
      callbacks: map() | nil
    }
    
    defstruct [
      :method,
      :operation_id,
      :summary,
      :description,
      :tags,
      :parameters,
      :request_body,
      :deprecated,
      :security,
      :servers,
      :external_docs,
      :callbacks,
      responses: %{}
    ]
  end

  defmodule Path do
    @moduledoc """
    Represents an OpenAPI path with its operations.
    """
    @type t :: %__MODULE__{
      path: String.t(),
      summary: String.t() | nil,
      description: String.t() | nil,
      operations: %{String.t() => Operation.t()},
      parameters: [Parameter.t()] | nil,
      servers: [map()] | nil
    }
    
    defstruct [
      :path,
      :summary,
      :description,
      :parameters,
      :servers,
      operations: %{}
    ]
  end

  defmodule Documentation do
    @moduledoc """
    Represents the parsed OpenAPI documentation.
    """
    @type t :: %__MODULE__{
      components: %{String.t() => Schema.t()},
      paths: %{String.t() => Path.t()},
      info: map() | nil,
      servers: [map()] | nil,
      security: [map()] | nil,
      tags: [map()] | nil,
      external_docs: map() | nil
    }
    
    defstruct [
      :info,
      :servers,
      :security,
      :tags,
      :external_docs,
      components: %{},
      paths: %{}
    ]
  end

  @doc """
  Parses OpenAPI YAML documentation and returns typed structs.
  """
  @spec get_documentation(String.t()) :: Documentation.t()
  def get_documentation(yml) do
    parsed_yaml = YamlElixir.read_from_string!(yml)
    
    %Documentation{
      components: parse_components(parsed_yaml["components"]),
      paths: parse_paths(parsed_yaml["paths"]),
      info: parsed_yaml["info"],
      servers: parsed_yaml["servers"],
      security: parsed_yaml["security"],
      tags: parsed_yaml["tags"],
      external_docs: parsed_yaml["externalDocs"]
    }
  end


  # Private functions

  defp parse_components(nil), do: %{}
  defp parse_components(components) do
    schemas = components["schemas"] || %{}
    
    Map.new(schemas, fn {name, schema_data} ->
      {name, parse_schema(name, schema_data)}
    end)
  end

  defp parse_schema(name, data) when is_map(data) do
    %Schema{
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

  defp parse_paths(nil), do: %{}
  defp parse_paths(paths) do
    Map.new(paths, fn {path_string, path_data} ->
      {path_string, parse_path(path_string, path_data)}
    end)
  end

  defp parse_path(path_string, data) when is_map(data) do
    # HTTP methods
    http_methods = ["get", "post", "put", "delete", "patch", "head", "options", "trace"]
    
    # Extract operations (HTTP methods)
    operations = 
      data
      |> Map.take(http_methods)
      |> Map.new(fn {method, operation_data} ->
        {method, parse_operation(method, operation_data)}
      end)
    
    %Path{
      path: path_string,
      summary: data["summary"],
      description: data["description"],
      operations: operations,
      parameters: parse_parameters(data["parameters"]),
      servers: data["servers"]
    }
  end

  defp parse_operation(method, data) when is_map(data) do
    %Operation{
      method: method,
      operation_id: data["operationId"],
      summary: data["summary"],
      description: data["description"],
      tags: data["tags"],
      parameters: parse_parameters(data["parameters"]),
      request_body: parse_request_body(data["requestBody"]),
      responses: parse_responses(data["responses"]),
      deprecated: data["deprecated"],
      security: data["security"],
      servers: data["servers"],
      external_docs: data["externalDocs"],
      callbacks: data["callbacks"]
    }
  end

  defp parse_parameters(nil), do: nil
  defp parse_parameters(parameters) when is_list(parameters) do
    Enum.map(parameters, &parse_parameter/1)
  end

  defp parse_parameter(data) when is_map(data) do
    %Parameter{
      name: data["name"],
      in: data["in"],
      description: data["description"],
      required: data["required"] || false,
      schema: data["schema"],
      deprecated: data["deprecated"],
      allow_empty_value: data["allowEmptyValue"],
      style: data["style"],
      explode: data["explode"],
      allow_reserved: data["allowReserved"],
      example: data["example"],
      examples: data["examples"]
    }
  end

  defp parse_request_body(nil), do: nil
  defp parse_request_body(data) when is_map(data) do
    %RequestBody{
      description: data["description"],
      required: data["required"] || false,
      content: data["content"] || %{}
    }
  end

  defp parse_responses(nil), do: %{}
  defp parse_responses(responses) when is_map(responses) do
    Map.new(responses, fn {status_code, response_data} ->
      {status_code, parse_response(status_code, response_data)}
    end)
  end

  defp parse_response(status_code, data) when is_map(data) do
    %Response{
      status_code: status_code,
      description: data["description"] || "",
      content: data["content"],
      headers: data["headers"],
      links: data["links"]
    }
  end
end