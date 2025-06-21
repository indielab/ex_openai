defmodule ExOpenAI.Codegen.DocsParser.Path do
  @moduledoc """
  Represents an OpenAPI path with its operations.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Parameter}

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

  @doc """
  Parses paths section from OpenAPI specification.
  """
  @spec parse_paths(map() | nil) :: %{String.t() => t()}
  def parse_paths(nil), do: %{}
  def parse_paths(paths) do
    Map.new(paths, fn {path_string, path_data} ->
      {path_string, parse_path(path_string, path_data)}
    end)
  end

  @doc """
  Parses a single path definition.
  """
  @spec parse_path(String.t(), map()) :: t()
  def parse_path(path_string, data) when is_map(data) do
    # HTTP methods
    http_methods = ["get", "post", "put", "delete", "patch", "head", "options", "trace"]
    
    # Extract operations (HTTP methods)
    operations = 
      data
      |> Map.take(http_methods)
      |> Map.new(fn {method, operation_data} ->
        {method, Operation.parse_operation(method, operation_data)}
      end)
    
    %__MODULE__{
      path: path_string,
      summary: data["summary"],
      description: data["description"],
      operations: operations,
      parameters: Parameter.parse_parameters(data["parameters"]),
      servers: data["servers"]
    }
  end
end

defmodule ExOpenAI.Codegen.DocsParser.Operation do
  @moduledoc """
  Represents an OpenAPI operation (HTTP method handler).
  """

  alias ExOpenAI.Codegen.DocsParser.{Parameter, RequestBody, Response}

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

  @doc """
  Parses a single operation definition.
  """
  @spec parse_operation(String.t(), map()) :: t()
  def parse_operation(method, data) when is_map(data) do
    %__MODULE__{
      method: method,
      operation_id: data["operationId"],
      summary: data["summary"],
      description: data["description"],
      tags: data["tags"],
      parameters: Parameter.parse_parameters(data["parameters"]),
      request_body: RequestBody.parse_request_body(data["requestBody"]),
      responses: Response.parse_responses(data["responses"]),
      deprecated: data["deprecated"],
      security: data["security"],
      servers: data["servers"],
      external_docs: data["externalDocs"],
      callbacks: data["callbacks"]
    }
  end
end

defmodule ExOpenAI.Codegen.DocsParser.Parameter do
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

  @doc """
  Parses a list of parameters.
  """
  @spec parse_parameters([map()] | nil) :: [t()] | nil
  def parse_parameters(nil), do: nil
  def parse_parameters(parameters) when is_list(parameters) do
    Enum.map(parameters, &parse_parameter/1)
  end

  @doc """
  Parses a single parameter definition.
  """
  @spec parse_parameter(map()) :: t()
  def parse_parameter(data) when is_map(data) do
    %__MODULE__{
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
end

defmodule ExOpenAI.Codegen.DocsParser.RequestBody do
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

  @doc """
  Parses a request body definition.
  """
  @spec parse_request_body(map() | nil) :: t() | nil
  def parse_request_body(nil), do: nil
  def parse_request_body(data) when is_map(data) do
    %__MODULE__{
      description: data["description"],
      required: data["required"] || false,
      content: data["content"] || %{}
    }
  end
end

defmodule ExOpenAI.Codegen.DocsParser.Response do
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

  @doc """
  Parses responses section.
  """
  @spec parse_responses(map() | nil) :: %{String.t() => t()}
  def parse_responses(nil), do: %{}
  def parse_responses(responses) when is_map(responses) do
    Map.new(responses, fn {status_code, response_data} ->
      {status_code, parse_response(status_code, response_data)}
    end)
  end

  @doc """
  Parses a single response definition.
  """
  @spec parse_response(String.t(), map()) :: t()
  def parse_response(status_code, data) when is_map(data) do
    %__MODULE__{
      status_code: status_code,
      description: data["description"] || "",
      content: data["content"],
      headers: data["headers"],
      links: data["links"]
    }
  end
end