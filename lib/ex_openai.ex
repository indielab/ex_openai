# Load and parse the OpenAPI YAML documentation at compile time
yaml_path = Path.join([__DIR__, "ex_openai", "docs", "docs.yaml"])
yaml_content = File.read!(yaml_path)
documentation = ExOpenAI.Codegen.DocsParser.get_documentation(yaml_content)

# Generate all component modules
documentation.components
|> Enum.map(fn {name, schema} ->
  # Add the name to the schema for the generator
  schema_with_name = Map.put(schema, :name, name)
  
  # Generate the module AST
  ExOpenAI.Codegen.ComponentModuleGenerator.generate_module(schema_with_name)
end)
|> Enum.each(&Code.eval_quoted(&1))

# Generate all API path modules  
documentation.paths
|> Map.values()
|> ExOpenAI.Codegen.PathModuleGenerator.generate_modules(documentation.components)
|> Enum.each(&Code.eval_quoted(&1))

# Main ExOpenAI module
defmodule ExOpenAI do
  @moduledoc """
  ExOpenAI SDK - Auto-generated Elixir client for the OpenAI API.
  
  This module provides access to all OpenAI API endpoints through generated modules.
  
  ## Component Modules
  
  All request/response structs are available under `ExOpenAI.Components.*`
  
  ## API Modules
  
  API endpoints are organized by resource:
  - `ExOpenAI.Chat` - Chat completion endpoints
  - `ExOpenAI.Images` - Image generation endpoints
  - `ExOpenAI.Audio` - Audio transcription and generation
  - etc.
  """
end