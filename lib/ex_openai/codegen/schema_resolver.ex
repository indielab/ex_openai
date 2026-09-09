defmodule ExOpenAI.Codegen.SchemaResolver do
  @moduledoc """
  Shared utilities for resolving OpenAPI schemas.

  Handles schema resolution including allOf merging and reference resolution.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema}

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

    # Create a new schema with merged properties and mark it as object type
    %Schema{
      schema
      | # Start with the original schema to preserve other fields
        # allOf merges always result in object type
        type: "object",
        properties: Map.merge(merged.properties, schema.properties || %{}),
        required: (merged.required ++ (schema.required || [])) |> Enum.uniq(),
        # Clear allOf since we've resolved it
        all_of: nil
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
    content_type = request_content_type(request_body)

    case get_in(request_body.content || %{}, [content_type, "schema"]) do
      %{"$ref" => "#/components/schemas/" <> name} ->
        case Map.get(schemas, name) do
          %Schema{} = schema -> resolve_schema(schema, schemas)
          _ -> nil
        end

      schema when is_map(schema) ->
        "request_body" |> Schema.parse_schema(schema) |> resolve_schema(schemas)

      _ ->
        nil
    end
  end

  @doc "Selects the request representation used by the generated function."
  def request_content_type(nil), do: "application/json"

  def request_content_type(%{content: content}) do
    content = content || %{}

    Enum.find(["multipart/form-data", "application/json"], &Map.has_key?(content, &1)) ||
      content |> Map.keys() |> Enum.sort() |> List.first() || "application/json"
  end

  @doc "Returns body properties supplied through keyword options."
  def optional_body_properties(request_body, schemas) do
    case get_request_body_schema(request_body, schemas) do
      %Schema{properties: properties, required: required} when is_map(properties) ->
        positional = if Map.get(request_body, :required), do: required || [], else: []
        properties |> Map.drop(positional) |> Enum.sort_by(&elem(&1, 0))

      _ ->
        []
    end
  end

  @doc false
  def multipart_file_fields(request_body, schemas) do
    case get_request_body_schema(request_body, schemas) do
      %Schema{properties: properties} when is_map(properties) ->
        properties
        |> Enum.filter(fn {_name, schema} -> file_schema?(schema, schemas, []) end)
        |> Enum.map(fn {name, _schema} -> String.to_atom(name) end)
        |> Enum.sort()

      _ ->
        []
    end
  end

  defp file_schema?(%Schema{format: "binary"}, _schemas, _seen), do: true

  defp file_schema?(%Schema{type: "array", items: items}, schemas, seen),
    do: file_schema?(items, schemas, seen)

  defp file_schema?(%Schema{ref: "#/components/schemas/" <> name}, schemas, seen) do
    name not in seen and file_schema?(Map.get(schemas, name), schemas, [name | seen])
  end

  defp file_schema?(%Schema{} = schema, schemas, seen) do
    Enum.any?((schema.one_of || []) ++ (schema.any_of || []), &file_schema?(&1, schemas, seen))
  end

  defp file_schema?(_, _schemas, _seen), do: false

  @doc false
  def sdk_stream_option?(operation, schemas) do
    body_fields = optional_body_properties(operation.request_body, schemas)
    query_fields = Enum.filter(operation.parameters || [], &(&1.in == "query"))

    not is_nil(response_schema(operation, :success, "text/event-stream")) and
      not Enum.any?(body_fields, fn {name, _} -> name == "stream" end) and
      not Enum.any?(query_fields, &(&1.name == "stream"))
  end

  @doc false
  def event_envelope?(schema, schemas), do: event_envelope?(schema, schemas, [])

  defp event_envelope?(%Schema{ref: "#/components/schemas/" <> name}, schemas, seen) do
    name not in seen and event_envelope?(Map.get(schemas, name), schemas, [name | seen])
  end

  defp event_envelope?(%Schema{one_of: members}, schemas, seen)
       when is_list(members) and members != [] do
    Enum.all?(members, &event_envelope?(&1, schemas, seen))
  end

  defp event_envelope?(%Schema{any_of: members}, schemas, seen)
       when is_list(members) and members != [] do
    Enum.all?(members, &event_envelope?(&1, schemas, seen))
  end

  defp event_envelope?(
         %Schema{
           properties: %{"event" => %Schema{type: "string"}, "data" => _},
           required: required
         },
         _schemas,
         _seen
       )
       when is_list(required),
       do: "event" in required and "data" in required

  defp event_envelope?(_schema, _schemas, _seen), do: false

  @doc false
  def raw_response?(%Schema{type: "string"}), do: true

  def raw_response?(%Schema{one_of: members}) when is_list(members) and members != [],
    do: Enum.all?(members, &raw_response?/1)

  def raw_response?(_schema), do: false

  @doc "Returns the schema for a status code or all documented successful responses."
  def response_schema(operation, status_code \\ :success, content_type \\ nil)

  def response_schema(%Operation{responses: nil}, _status_code, _content_type), do: nil

  def response_schema(%Operation{responses: responses}, status_code, content_type) do
    schemas =
      responses
      |> Enum.filter(fn {code, _} ->
        if status_code == :success,
          do: String.match?(code, ~r/^2\d\d$/),
          else: code == status_code
      end)
      |> Enum.sort_by(&elem(&1, 0))
      |> Enum.flat_map(fn {_code, response} ->
        content = Map.get(response, :content) || %{}

        media_types =
          if content_type,
            do: [content_type],
            else:
              content |> Map.keys() |> Enum.reject(&(&1 == "text/event-stream")) |> Enum.sort()

        Enum.flat_map(media_types, fn media_type ->
          case get_in(content, [media_type, "schema"]) do
            schema when is_map(schema) -> [Schema.parse_schema("response", schema)]
            _ -> []
          end
        end)
      end)
      |> Enum.flat_map(fn
        %Schema{one_of: members, discriminator: nil, nullable: nullable}
        when is_list(members) and nullable != true ->
          members

        schema ->
          [schema]
      end)
      |> Enum.uniq()

    case schemas do
      [] -> nil
      [schema] -> schema
      multiple -> %Schema{one_of: multiple}
    end
  end
end
