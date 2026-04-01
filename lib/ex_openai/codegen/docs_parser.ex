defmodule ExOpenAI.Codegen.DocsParser do
  @moduledoc """
  Parser for OpenAPI YAML documentation.
  
  Provides typed structs for components and paths to improve visibility
  and type safety when working with the OpenAPI specification.
  """

  alias ExOpenAI.Codegen.DocsParser.{Schema, Path}

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
      components: Schema.parse_components(parsed_yaml["components"]),
      paths: Path.parse_paths(parsed_yaml["paths"]),
      info: parsed_yaml["info"],
      servers: parsed_yaml["servers"],
      security: parsed_yaml["security"],
      tags: parsed_yaml["tags"],
      external_docs: parsed_yaml["externalDocs"]
    }
  end
end