defmodule ExOpenAI.Codegen.PathModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Path structs.

  Groups paths by their first path segment and generates modules with functions
  for each operation.
  """

  alias ExOpenAI.Codegen.DocsParser.{Path, Operation, Schema, RequestBody}
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
        @moduledoc false

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
      case String.split(path.path, "/", trim: true) do
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
      |> Enum.map(&String.capitalize/1)
      |> Enum.join("")

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
      |> Map.values()
      |> Enum.map(&generate_function(&1, schemas, path.path))
      |> Enum.reject(&is_nil/1)
    end)
  end

  # Generate a function from an operation
  defp generate_function(%Operation{operation_id: nil}, _schemas, _path), do: nil

  defp generate_function(%Operation{operation_id: op_id} = operation, schemas, path) do
    function_name = operation_id_to_function_name(op_id)
    {args, arg_names, optional_param_names} = build_function_args(operation, schemas)

    # Generate documentation and spec
    doc_ast = FunctionDocGenerator.generate_doc(operation)
    spec_ast = FunctionDocGenerator.generate_spec(operation, function_name, arg_names, schemas)

    # Generate the function body inline to avoid hygiene issues
    {path_params, query_params, _body} = FunctionBodyGenerator.categorize_parameters(operation)

    http_method = FunctionBodyGenerator.determine_http_method(operation)
    content_type = FunctionBodyGenerator.determine_content_type(operation)

    # Build the data we need for the function body
    path_param_names = Enum.map(path_params, fn p -> String.to_atom(p.name) end)
    query_param_names = Enum.map(query_params, fn p -> String.to_atom(p.name) end)

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
        unquote(
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

        query_string =
          if length(query_params) > 0 do
            "?" <> URI.encode_query(query_params)
          else
            ""
          end

        # Append query string
        url = url <> query_string

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
        optional_body_params = Keyword.take(opts, unquote(optional_param_names))
        body_params = body_params ++ optional_body_params

        # Strip optional parameters that were added to body_params from opts
        opts = Keyword.drop(opts, unquote(optional_param_names))

        # Debug output
        # IO.puts("body_arg_names: #{inspect(unquote(body_arg_names))}")
        # IO.puts("optional_param_names: #{inspect(unquote(optional_param_names))}")
        # IO.puts("body_params: #{inspect(body_params)}")
        # IO.puts("http_method: #{inspect(unquote(http_method))}")
        # IO.puts("url: #{inspect(url)}")
        # IO.puts("opts: #{inspect(opts)}")

        # Simple convert function for now
        convert_response = fn response -> response end

        # Make the HTTP call
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
    # Get the schema reference from the content (supports both JSON and multipart)
    schema_ref =
      case content do
        %{"application/json" => %{"schema" => %{"$ref" => ref}}} -> ref
        %{"multipart/form-data" => %{"schema" => %{"$ref" => ref}}} -> ref
        _ -> nil
      end

    case schema_ref do
      "#/components/schemas/" <> schema_name ->
        # Resolve the schema and extract required fields
        case Map.get(schemas, schema_name) do
          %Schema{} = schema ->
            resolved_schema = SchemaResolver.resolve_schema(schema, schemas)
            extract_required_fields(resolved_schema)

          _ ->
            []
        end

      _ ->
        []
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

  # Extract optional parameters from operation (query params + optional body params)
  defp extract_optional_parameters(%Operation{} = operation, schemas) do
    # Extract query parameters (always optional)
    query_params = extract_query_parameter_names(operation.parameters)

    # Extract optional body parameters
    optional_body_params = extract_optional_body_parameters(operation.request_body, schemas)

    # Combine and sort for consistent ordering
    (query_params ++ optional_body_params)
    |> Enum.uniq()
    |> Enum.sort()
  end

  # Extract query parameter names
  defp extract_query_parameter_names(nil), do: []

  defp extract_query_parameter_names(params) when is_list(params) do
    params
    |> Enum.filter(fn param -> param.in == "query" end)
    |> Enum.map(fn param -> String.to_atom(param.name) end)
  end

  # Extract optional body parameters (properties not in required list)
  defp extract_optional_body_parameters(nil, _schemas), do: []

  defp extract_optional_body_parameters(%RequestBody{content: content}, schemas) do
    # Get the schema reference from the content
    schema_ref =
      case content do
        %{"application/json" => %{"schema" => %{"$ref" => ref}}} -> ref
        %{"multipart/form-data" => %{"schema" => %{"$ref" => ref}}} -> ref
        _ -> nil
      end

    case schema_ref do
      "#/components/schemas/" <> schema_name ->
        # Resolve the schema
        case Map.get(schemas, schema_name) do
          %Schema{} = schema ->
            resolved_schema = SchemaResolver.resolve_schema(schema, schemas)
            extract_optional_field_names(resolved_schema)

          _ ->
            []
        end

      _ ->
        []
    end
  end

  # Extract optional field names from a schema (those not in required list)
  defp extract_optional_field_names(%Schema{properties: nil}), do: []

  defp extract_optional_field_names(%Schema{properties: props, required: required}) do
    required_list = required || []

    props
    |> Map.keys()
    |> Enum.filter(fn name -> name not in required_list end)
    |> Enum.map(&String.to_atom/1)
  end

  defp extract_optional_field_names(_), do: []

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
end
