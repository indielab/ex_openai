defmodule ExOpenAI.Codegen.PathModuleGenerator do
  @moduledoc """
  Generates Elixir modules from parsed OpenAPI Path structs.
  
  Groups paths by their tag and generates modules with function stubs
  for each operation.
  """

  alias ExOpenAI.Codegen.DocsParser.{Path, Operation, Schema, RequestBody, Parameter}

  @doc """
  Generates modules from a list of Path structs.
  
  Groups paths by their tag and returns a list of module ASTs.
  """
  @spec generate_modules([Path.t()], %{String.t() => Schema.t()}) :: [Macro.t()]
  def generate_modules(paths, schemas \\ %{}) when is_list(paths) do
    paths
    |> group_paths_by_tag()
    |> Enum.map(fn {tag, paths} -> generate_module(tag, paths, schemas) end)
  end

  @doc """
  Generates a single module from paths that share the same tag.
  """
  @spec generate_module(String.t() | nil, [Path.t()], %{String.t() => Schema.t()}) :: Macro.t()
  def generate_module(tag, paths, schemas \\ %{}) when is_list(paths) do
    module_name = determine_module_name(tag, paths)
    functions = extract_all_functions(paths, schemas)
    
    quote do
      defmodule unquote(module_name) do
        @moduledoc false
        
        unquote_splicing(functions)
      end
    end
  end

  # Group paths by their tag
  defp group_paths_by_tag(paths) do
    paths
    |> Enum.flat_map(fn path ->
      # Get all unique tags from all operations in this path
      tags = path.operations
             |> Map.values()
             |> Enum.flat_map(fn op -> op.tags || [] end)
             |> Enum.uniq()
      
      # If no tags, use nil as the key
      if tags == [] do
        [{nil, path}]
      else
        # Create an entry for each tag
        Enum.map(tags, fn tag -> {tag, path} end)
      end
    end)
    |> Enum.group_by(
      fn {tag, _path} -> tag end,
      fn {_tag, path} -> path end
    )
  end

  # Determine module name from tag or operation
  defp determine_module_name(tag, _paths) when is_binary(tag) do
    String.to_atom("Elixir.ExOpenAI.#{tag}")
  end
  
  defp determine_module_name(nil, paths) do
    # Try to derive from first operation_id
    first_op = paths
               |> List.first()
               |> Map.get(:operations)
               |> Map.values()
               |> List.first()
    
    case first_op do
      %Operation{operation_id: op_id} when is_binary(op_id) ->
        # Extract module name from operation_id
        # e.g., "ListContainers" -> "Containers"
        module_part = op_id
                     |> String.replace(~r/^(list|create|get|update|delete|modify)/i, "")
                     |> String.trim()
        
        String.to_atom("Elixir.ExOpenAI.#{module_part}")
      
      _ ->
        # Fallback to Unknown
        String.to_atom("Elixir.ExOpenAI.Unknown")
    end
  end

  # Extract all functions from all paths
  defp extract_all_functions(paths, schemas) do
    paths
    |> Enum.flat_map(fn path ->
      path.operations
      |> Map.values()
      |> Enum.map(&generate_function(&1, schemas))
      |> Enum.reject(&is_nil/1)
    end)
  end

  # Generate a function from an operation
  defp generate_function(%Operation{operation_id: nil}, _schemas), do: nil
  defp generate_function(%Operation{operation_id: op_id} = operation, schemas) do
    function_name = operation_id_to_function_name(op_id)
    {args, arg_names} = build_function_args(operation, schemas)
    
    quote do
      def unquote(function_name)(unquote_splicing(args)) do
        # TODO: Implement
        {unquote_splicing(arg_names), :ok}
      end
    end
  end

  # Build function arguments based on operation parameters and request body
  defp build_function_args(%Operation{parameters: params, request_body: request_body}, schemas) do
    # Extract path parameters (always required)
    path_params = extract_path_parameters(params)
    
    # Extract request body required fields
    body_params = case request_body do
      %RequestBody{required: true, content: content} ->
        extract_required_args(content, schemas)
      _ ->
        []
    end
    
    # Combine all required parameters and sort alphabetically
    all_required = (path_params ++ body_params) |> Enum.sort_by(fn
      {name, _, _} -> name
      _ -> nil
    end)
    
    # Check if we have any non-path required parameters
    has_required_query_params = params != nil && Enum.any?(params, fn p -> 
      p.in != "path" && p.required
    end)
    
    if all_required == [] && !has_required_query_params do
      # Only optional parameters, use opts
      {[quote(do: opts \\ [])], [quote(do: opts)]}
    else
      # Has required parameters
      args = all_required ++ [quote(do: opts \\ [])]
      arg_names = Enum.map(all_required, fn arg -> 
        case arg do
          {name, _, _} -> quote(do: unquote(name))
          _ -> arg
        end
      end) ++ [quote(do: opts)]
      {args, arg_names}
    end
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
    # Get the schema reference from the content
    schema_ref = case content do
      %{"application/json" => %{"schema" => %{"$ref" => ref}}} -> ref
      _ -> nil
    end
    
    case schema_ref do
      "#/components/schemas/" <> schema_name ->
        # Resolve the schema and extract required fields
        case Map.get(schemas, schema_name) do
          %Schema{} = schema ->
            resolved_schema = resolve_schema(schema, schemas)
            extract_required_fields(resolved_schema)
          _ ->
            []
        end
      _ ->
        []
    end
  end

  # Resolve a schema, handling allOf merging
  defp resolve_schema(%Schema{all_of: all_of} = schema, schemas) when is_list(all_of) and all_of != [] do
    # Merge all schemas in allOf
    merged = Enum.reduce(all_of, %{properties: %{}, required: []}, fn
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
  
  defp resolve_schema(schema, _schemas), do: schema

  # Extract required field names as function arguments
  defp extract_required_fields(%Schema{required: required}) when is_list(required) do
    required
    |> Enum.sort()  # Sort for consistent ordering
    |> Enum.map(&String.to_atom/1)
    |> Enum.map(fn name -> Macro.var(name, nil) end)
  end
  
  defp extract_required_fields(_), do: []

  # Convert operationId from camelCase to snake_case
  defp operation_id_to_function_name(operation_id) do
    operation_id
    # Handle transitions from lowercase to uppercase
    |> String.replace(~r/([a-z\d])([A-Z])/, "\\1_\\2")
    # Handle transitions from multiple uppercase letters to lowercase
    |> String.replace(~r/([A-Z]+)([A-Z][a-z])/, "\\1_\\2")
    |> String.downcase()
    |> String.to_atom()
  end
end