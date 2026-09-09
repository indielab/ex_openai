defmodule ExOpenAI.Codegen.PathModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Path structs.

  Groups paths by their first path segment and generates modules with functions
  for each operation.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Path, RequestBody, Schema}
  alias ExOpenAI.Codegen.{FunctionBodyGenerator, FunctionDocGenerator, SchemaResolver}

  @doc """
  Generates modules from a list of Path structs.

  Groups paths by their first path segment and returns a list of module ASTs.
  """
  @spec generate_modules([Path.t()], %{String.t() => Schema.t()}) :: [Macro.t()]
  def generate_modules(paths, schemas \\ %{}) when is_list(paths) do
    paths
    |> group_paths_by_prefix()
    |> Enum.map(fn {prefix, paths} -> generate_module(prefix, paths, schemas) end)
  end

  @doc """
  Generates a single module from paths that share the same prefix.
  """
  @spec generate_module(String.t() | nil, [Path.t()], %{String.t() => Schema.t()}) :: Macro.t()
  def generate_module(prefix, paths, schemas \\ %{}) when is_list(paths) do
    module_name = determine_module_name(prefix, paths)
    functions = extract_all_functions(paths, schemas)

    quote do
      defmodule unquote(module_name) do
        @moduledoc unquote("Functions for the OpenAI #{prefix || "root"} API.")

        unquote_splicing(functions)
      end
    end
  end

  # Group paths by their first path segment
  defp group_paths_by_prefix(paths) do
    paths
    |> Enum.group_by(fn path ->
      # Extract the first segment of the path
      # e.g., "/chat/completions" -> "chat"
      # e.g., "/organization/admin_api_keys" -> "organization"
      case String.split(URI.parse(path.path).path || "/", "/", trim: true) do
        [] -> nil
        [first | _] -> first
      end
    end)
  end

  # Determine module name from path prefix
  defp determine_module_name(prefix, _paths) when is_binary(prefix) do
    # Convert path prefix to valid module name
    # e.g., "chat" -> "Chat"
    # e.g., "fine_tuning" -> "FineTuning"
    # e.g., "organization" -> "Organization"
    module_part =
      prefix
      |> String.replace("_", " ")
      |> String.split(" ")
      |> Enum.map_join("", &String.capitalize/1)

    String.to_atom("Elixir.ExOpenAI.#{module_part}")
  end

  defp determine_module_name(nil, _paths) do
    # Fallback to Root for paths without prefix (shouldn't happen)
    String.to_atom("Elixir.ExOpenAI.Root")
  end

  # Extract all functions from all paths
  defp extract_all_functions(paths, schemas) do
    paths
    |> Enum.flat_map(fn path ->
      path.operations
      |> Enum.sort_by(&elem(&1, 0))
      |> Enum.map(&elem(&1, 1))
      |> Enum.map(&generate_function(&1, schemas, path.path))
      |> Enum.reject(&is_nil/1)
    end)
  end

  # Generate a function from an operation
  defp generate_function(%Operation{operation_id: nil}, _schemas, _path), do: nil

  defp generate_function(%Operation{operation_id: op_id} = operation, schemas, path) do
    function_name = operation_id_to_function_name(op_id)
    {args, arg_names, optional_param_names} = build_function_args(operation, schemas)

    # Get the response schema reference for this operation
    response_schema_ref = get_response_schema(operation, :success, schemas)
    stream_response_schema_ref = get_stream_response_schema(operation, :success, schemas)

    # Generate documentation and spec
    doc_ast = FunctionDocGenerator.generate_doc(operation, schemas)
    spec_ast = FunctionDocGenerator.generate_spec(operation, function_name, arg_names, schemas)

    # Generate the function body inline to avoid hygiene issues
    {path_params, query_params, _body} = FunctionBodyGenerator.categorize_parameters(operation)

    http_method = FunctionBodyGenerator.determine_http_method(operation)
    content_type = FunctionBodyGenerator.determine_content_type(operation)

    supports_streaming? =
      :stream in optional_param_names or not is_nil(stream_response_schema_ref)

    stream_convert_response_ast =
      case stream_response_schema_ref do
        nil ->
          case response_schema_ref do
            nil ->
              quote do
                fn
                  {:ok, map} when is_map(map) -> {:ok, ExOpenAI.StreamingClient.atomize_keys(map)}
                  other -> other
                end
              end

            response_schema ->
              quote do
                fn response ->
                  ExOpenAI.Codegen.ResponseConverter.convert_response(
                    response,
                    unquote(schema_ast(response_schema))
                  )
                end
              end
          end

        stream_schema ->
          quote do
            fn response ->
              ExOpenAI.Codegen.ResponseConverter.convert_response(
                response,
                unquote(schema_ast(stream_schema))
              )
            end
          end
      end

    response_convert_response_ast =
      quote do
        fn response ->
          ExOpenAI.Codegen.ResponseConverter.convert_response(
            response,
            unquote(schema_ast(response_schema_ref))
          )
        end
      end

    # Build the data we need for the function body
    path_param_names = Enum.map(path_params, fn p -> String.to_atom(p.name) end)
    query_param_names = Enum.map(query_params, fn p -> String.to_atom(p.name) end)

    header_param_names =
      (operation.parameters || [])
      |> Enum.filter(&(&1.in == "header"))
      |> Enum.map(&String.to_atom(&1.name))

    optional_body_names =
      SchemaResolver.optional_body_properties(operation.request_body, schemas)
      |> Enum.map(fn {name, _} -> String.to_atom(name) end)

    multipart_fields = SchemaResolver.multipart_file_fields(operation.request_body, schemas)

    multipart_encoding =
      get_in(
        (operation.request_body && operation.request_body.content) || %{},
        ["multipart/form-data", "encoding"]
      ) || %{}

    body_arg_names =
      arg_names
      |> Enum.filter(fn name ->
        name != :opts and name not in path_param_names
      end)

    quote do
      unquote(doc_ast)
      unquote(spec_ast)

      def unquote(function_name)(unquote_splicing(args)) do
        # binding = binding()

        # Start with the base URL
        url = unquote(path)

        # Replace path parameters
        unquote_splicing(
          path_params
          |> Enum.map(fn param ->
            param_name = String.to_atom(param.name)
            pattern = "{#{param.name}}"

            quote do
              url =
                String.replace(
                  url,
                  unquote(pattern),
                  to_string(unquote(Macro.var(param_name, nil)))
                )
            end
          end)
        )

        # Build query string from opts
        query_params = Keyword.take(opts, unquote(query_param_names))

        url = ExOpenAI.Query.append(url, query_params)

        # Build body parameters
        body_params = [
          unquote_splicing(
            body_arg_names
            |> Enum.map(fn name ->
              quote do
                {unquote(name), unquote(Macro.var(name, nil))}
              end
            end)
          )
        ]

        # Add optional parameters from opts to body_params
        optional_body_params = Keyword.take(opts, unquote(optional_body_names))
        body_params = body_params ++ optional_body_params

        unquote_splicing(
          List.wrap(
            if header_param_names != [] do
              quote do
                headers =
                  Enum.map(Keyword.take(opts, unquote(header_param_names)), fn {name, value} ->
                    {Atom.to_string(name),
                     if(is_list(value), do: Enum.join(value, ","), else: to_string(value))}
                  end)

                opts = Keyword.put(opts, :request_headers, headers)
              end
            end
          )
        )

        unquote_splicing(
          List.wrap(
            if SchemaResolver.raw_response?(response_schema_ref) do
              quote do: opts = Keyword.put(opts, :response_mode, :raw)
            end
          )
        )

        unquote_splicing(
          List.wrap(
            if SchemaResolver.event_envelope?(stream_response_schema_ref, schemas) do
              quote do: opts = Keyword.put(opts, :event_envelope, true)
            end
          )
        )

        # Keep :stream in opts for streaming client while still sending it in body
        optional_params_to_drop =
          unquote(optional_param_names)
          |> Enum.reject(&(&1 == :stream))

        # Strip optional parameters (except :stream) that were added to body_params from opts
        opts = Keyword.drop(opts, optional_params_to_drop)

        # Choose convert_response based on streaming flag:
        # - streaming: use the SSE schema when available, otherwise fall back to atomized maps
        # - non-streaming: use full response converter with schema
        convert_response =
          unquote(
            build_convert_response_ast(
              supports_streaming?,
              stream_convert_response_ast,
              response_convert_response_ast
            )
          )

        unquote(
          if content_type == :"multipart/form-data" do
            quote do
              body_params =
                ExOpenAI.Client.prepare_multipart(
                  body_params,
                  unquote(multipart_fields),
                  unquote(Macro.escape(multipart_encoding))
                )
            end
          end
        )

        ExOpenAI.Config.http_client().api_call(
          unquote(http_method),
          url,
          body_params,
          unquote(content_type),
          opts,
          convert_response
        )
      end
    end
  end

  defp build_convert_response_ast(
         true,
         stream_convert_response_ast,
         response_convert_response_ast
       ) do
    quote do
      if Keyword.get(opts, :stream, false) do
        unquote(stream_convert_response_ast)
      else
        unquote(response_convert_response_ast)
      end
    end
  end

  defp build_convert_response_ast(
         false,
         _stream_convert_response_ast,
         response_convert_response_ast
       ) do
    response_convert_response_ast
  end

  # Emit a compact `%Schema{}` literal for generated modules.
  #
  # We only keep fields that affect runtime response conversion or typespec
  # generation. That preserves refs, unions, inline object schemas, arrays,
  # enums, nullability, and discriminators without serializing doc-only
  # metadata into every generated function.
  #
  # The return value here is quoted AST for a literal like:
  #
  #   %ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/Response"}
  #
  # rather than a fully materialized runtime struct escaped with
  # `Macro.escape/1`. That keeps generated modules readable while still giving
  # `ResponseConverter` a real `%Schema{}` value at runtime.
  @spec schema_ast(Schema.t() | nil) :: Macro.t()
  defp schema_ast(nil), do: nil

  defp schema_ast(%Schema{} = schema) do
    fields =
      []
      |> maybe_put_schema_field(:ref, schema.ref)
      |> maybe_put_schema_field(:type, schema.type)
      |> maybe_put_schema_field(:format, schema.format)
      |> maybe_put_schema_field(:properties, properties_ast(schema.properties))
      |> maybe_put_schema_field(:required, schema.required)
      |> maybe_put_schema_field(:enum, schema.enum)
      |> maybe_put_schema_field(:all_of, schema_list_ast(schema.all_of))
      |> maybe_put_schema_field(:one_of, schema_list_ast(schema.one_of))
      |> maybe_put_schema_field(:any_of, schema_list_ast(schema.any_of))
      |> maybe_put_schema_field(:items, schema_ast(schema.items))
      |> maybe_put_schema_field(
        :additional_properties,
        literal_ast(schema.additional_properties)
      )
      |> maybe_put_schema_field(:nullable, schema.nullable)
      |> maybe_put_schema_field(:discriminator, literal_ast(schema.discriminator))

    {:%, [], [schema_alias_ast(), {:%{}, [], fields}]}
  end

  # Convert nested schema lists used by `allOf` / `oneOf` / `anyOf` into
  # quoted `%Schema{}` literals recursively.
  defp schema_list_ast(nil), do: nil
  defp schema_list_ast(schemas) when is_list(schemas), do: Enum.map(schemas, &schema_ast/1)

  # Build the quoted `%{...}` for object properties, where each property value
  # is itself another quoted schema literal. Empty property maps are omitted so
  # we don't emit `%Schema{properties: %{}}` noise in generated modules.
  defp properties_ast(nil), do: nil
  defp properties_ast(properties) when map_size(properties) == 0, do: nil

  defp properties_ast(properties) when is_map(properties) do
    {:%{}, [], Enum.map(properties, fn {key, value} -> {key, schema_ast(value)} end)}
  end

  # Keep simple values as quoted literals. This is used for discriminator maps
  # and `additional_properties`, which are runtime data rather than nested
  # schema structs.
  defp literal_ast(nil), do: nil
  defp literal_ast(value), do: Macro.escape(value)

  # Omit fields that would only add visual noise to generated code. We only
  # skip values that have no effect on conversion logic: `nil`, empty lists, and
  # empty quoted maps.
  defp maybe_put_schema_field(fields, _field, nil), do: fields
  defp maybe_put_schema_field(fields, _field, []), do: fields
  defp maybe_put_schema_field(fields, _field, {:%{}, [], []}), do: fields

  defp maybe_put_schema_field(fields, field, value) do
    fields ++ [{field, value}]
  end

  # Emit the `%Schema{...}` struct alias in quoted form so `schema_ast/1` can
  # construct a literal struct AST without relying on `quote do` blocks.
  defp schema_alias_ast do
    {:__aliases__, [alias: false], [:ExOpenAI, :Codegen, :DocsParser, :Schema]}
  end

  # Build function arguments based on operation parameters and request body
  defp build_function_args(
         %Operation{parameters: params, request_body: request_body} = operation,
         schemas
       ) do
    # Extract path parameters (always required)
    path_params = extract_path_parameters(params)

    # Extract request body required fields
    body_params =
      case request_body do
        %RequestBody{required: true, content: content} ->
          extract_required_args(content, schemas)

        _ ->
          []
      end

    # Combine all required parameters and sort alphabetically
    all_required =
      (path_params ++ body_params)
      |> Enum.sort_by(fn
        {name, _, _} -> name
        _ -> nil
      end)

    # Always have opts as the last parameter
    args = all_required ++ [quote(do: opts \\ [])]

    # Extract just the atom names for passing to body generator
    arg_atoms =
      (Enum.map(all_required, fn arg ->
         case arg do
           {name, _, _} -> name
           _ -> nil
         end
       end) ++ [:opts])
      |> Enum.filter(&(&1 != nil))

    # Extract optional parameters
    optional_params = extract_optional_parameters(operation, schemas)

    {args, arg_atoms, optional_params}
  end

  # Extract path parameters from the parameters list
  defp extract_path_parameters(nil), do: []

  defp extract_path_parameters(params) when is_list(params) do
    params
    |> Enum.filter(fn param -> param.in == "path" end)
    |> Enum.map(fn param ->
      name = String.to_atom(param.name)
      Macro.var(name, nil)
    end)
  end

  # Extract required arguments from request body content
  defp extract_required_args(content, schemas) do
    case SchemaResolver.get_request_body_schema(%RequestBody{content: content}, schemas) do
      %Schema{} = schema -> extract_required_fields(schema)
      nil -> []
    end
  end

  # Extract required field names as function arguments
  defp extract_required_fields(%Schema{required: required}) when is_list(required) do
    required
    # Sort for consistent ordering
    |> Enum.sort()
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(fn name -> Macro.var(name, nil) end)
  end

  defp extract_required_fields(_), do: []

  # Extract optional parameters from query, headers, and the request body
  defp extract_optional_parameters(%Operation{} = operation, schemas) do
    # Query and header parameters are supplied through opts.
    parameter_names = extract_query_and_header_parameter_names(operation.parameters)

    # Extract optional body parameters
    optional_body_params = extract_optional_body_parameters(operation.request_body, schemas)

    # Combine and sort for consistent ordering
    (parameter_names ++ optional_body_params)
    |> Enum.uniq()
    |> Enum.sort()
  end

  # Extract query and header parameter names
  defp extract_query_and_header_parameter_names(nil), do: []

  defp extract_query_and_header_parameter_names(params) when is_list(params) do
    params
    |> Enum.filter(fn param -> param.in in ["query", "header"] end)
    |> Enum.map(fn param -> String.to_atom(param.name) end)
  end

  defp extract_optional_body_parameters(request_body, schemas) do
    SchemaResolver.optional_body_properties(request_body, schemas)
    |> Enum.map(fn {name, _schema} -> String.to_atom(name) end)
  end

  # Convert operationId from camelCase to snake_case
  defp operation_id_to_function_name(operation_id) do
    operation_id
    # First replace hyphens with underscores
    |> String.replace("-", "_")
    # Handle transitions from lowercase to uppercase
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    # Handle transitions from multiple uppercase letters to lowercase
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.downcase()
    |> String.to_atom()
  end

  def get_response_schema(operation, status_code, _schemas) do
    SchemaResolver.response_schema(operation, status_code)
  end

  def get_stream_response_schema(operation, status_code, _schemas) do
    SchemaResolver.response_schema(operation, status_code, "text/event-stream")
  end
end
