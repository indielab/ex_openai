defmodule ExOpenAI.Codegen.SchemaResolver do
  @moduledoc """
  Shared utilities for resolving OpenAPI schemas.
  
  Handles schema resolution including allOf merging and reference resolution.
  """
  
  alias ExOpenAI.Codegen.DocsParser.Schema
  
  @doc """
  Resolves a schema, handling allOf merging.
  
  When a schema contains `allOf`, this function merges all referenced schemas
  and inline schemas into a single resolved schema with combined properties
  and required fields.
  
  ## Examples
  
      iex> schema = %Schema{
      ...>   all_of: [
      ...>     %Schema{ref: "#/components/schemas/Base"},
      ...>     %Schema{properties: %{"extra" => %Schema{type: "string"}}}
      ...>   ]
      ...> }
      iex> schemas = %{"Base" => %Schema{properties: %{"id" => %Schema{type: "integer"}}}}
      iex> resolved = resolve_schema(schema, schemas)
      iex> Map.keys(resolved.properties)
      ["extra", "id"]
  
  """
  @spec resolve_schema(Schema.t(), %{String.t() => Schema.t()}) :: Schema.t()
  def resolve_schema(%Schema{all_of: all_of} = schema, schemas)
      when is_list(all_of) and all_of != [] do
    # Merge all schemas in allOf
    merged =
      Enum.reduce(all_of, %{properties: %{}, required: []}, fn
        %Schema{ref: "#/components/schemas/" <> name}, acc ->
          case Map.get(schemas, name) do
            %Schema{} = ref_schema ->
              resolved = resolve_schema(ref_schema, schemas)

              %{
                properties: Map.merge(acc.properties, resolved.properties || %{}),
                required: (acc.required ++ (resolved.required || [])) |> Enum.uniq()
              }

            _ ->
              acc
          end

        %Schema{properties: props, required: req}, acc ->
          %{
            properties: Map.merge(acc.properties, props || %{}),
            required: (acc.required ++ (req || [])) |> Enum.uniq()
          }
      end)

    %Schema{
      properties: Map.merge(merged.properties, schema.properties || %{}),
      required: (merged.required ++ (schema.required || [])) |> Enum.uniq()
    }
  end

  def resolve_schema(schema, _schemas), do: schema
  
  @doc """
  Gets and resolves the schema for a request body.
  
  Extracts the schema reference from the request body content and resolves it
  using the provided schemas map.
  
  ## Parameters
  
    * `request_body` - The request body from an operation
    * `schemas` - Map of schema names to Schema structs
    
  ## Returns
  
  The resolved schema or nil if no schema is found.
  """
  @spec get_request_body_schema(map() | nil, %{String.t() => Schema.t()}) :: Schema.t() | nil
  def get_request_body_schema(nil, _schemas), do: nil
  
  def get_request_body_schema(request_body, schemas) do
    case request_body.content do
      %{"application/json" => %{"schema" => %{"$ref" => "#/components/schemas/" <> schema_name}}} ->
        case Map.get(schemas, schema_name) do
          %Schema{} = schema -> resolve_schema(schema, schemas)
          _ -> nil
        end
      _ -> nil
    end
  end
end