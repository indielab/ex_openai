defmodule ExOpenAI.Codegen.FunctionDocGenerator do
  @moduledoc """
  Generates @doc and @spec attributes for OpenAPI operation functions.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema}
  alias ExOpenAI.Codegen.TypespecGenerator

  @doc """
  Generates @doc attribute for an operation.

  Uses the operation's summary and description, plus parameter documentation.
  """
  @spec generate_doc(Operation.t()) :: Macro.t()
  def generate_doc(%Operation{} = operation) do
    doc_content = build_doc_content(operation)
    
    quote do
      @doc unquote(doc_content)
    end
  end

  @doc """
  Generates @spec attribute for an operation function.
  
  Builds proper typespecs for all parameters and return types.
  """
  @spec generate_spec(Operation.t(), atom(), [atom()], %{String.t() => Schema.t()}) :: Macro.t()
  def generate_spec(%Operation{} = operation, function_name, arg_names, schemas) do
    param_specs = build_param_specs(operation, arg_names, schemas)
    return_spec = build_return_spec(operation, function_name)
    
    quote do
      @spec unquote(function_name)(unquote_splicing(param_specs)) :: unquote(return_spec)
    end
  end

  # Build the documentation string
  defp build_doc_content(%Operation{} = operation) do
    sections = []
    
    # Add summary
    sections = if operation.summary do
      [operation.summary | sections]
    else
      sections
    end
    
    # Add description if different from summary
    sections = if operation.description && operation.description != operation.summary do
      sections ++ ["", operation.description]
    else
      sections
    end
    
    # Add parameter documentation
    param_docs = build_parameter_docs(operation)
    sections = if param_docs != "" do
      sections ++ ["", "## Options", "", param_docs]
    else
      sections
    end
    
    Enum.join(sections, "\n")
  end

  # Build parameter documentation for @doc
  defp build_parameter_docs(%Operation{parameters: nil}), do: ""
  defp build_parameter_docs(%Operation{parameters: params}) do
    # Only document query and header parameters (path params are positional args)
    params
    |> Enum.filter(fn p -> p.in in ["query", "header"] end)
    |> Enum.map(fn param ->
      description = param.description || ""
      # Clean up description - remove trailing newlines
      description = String.trim(description)
      
      # Add default value info if present
      description = case param.schema do
        %{"default" => default} -> "#{description} Defaults to `#{inspect(default)}`."
        _ -> description
      end
      
      "  * `:#{param.name}` - #{description}"
    end)
    |> Enum.join("\n")
  end

  # Build parameter type specifications
  defp build_param_specs(%Operation{} = operation, arg_names, schemas) do
    # Remove :opts from arg_names for now, we'll add it specially
    positional_args = Enum.filter(arg_names, &(&1 != :opts))
    
    # Get the resolved schema for the request body
    body_schema = get_request_body_schema(operation, schemas)
    
    # Build specs for positional arguments
    positional_specs = Enum.map(positional_args, fn arg_name ->
      # Check if this is a path parameter
      path_param = find_path_parameter(operation, arg_name)
      
      type_spec = cond do
        # Path parameter
        path_param != nil ->
          derive_type_from_parameter(path_param)
          
        # Body parameter - look it up in the resolved schema
        body_schema != nil && body_schema.properties != nil ->
          case Map.get(body_schema.properties, Atom.to_string(arg_name)) do
            %Schema{} = prop_schema ->
              TypespecGenerator.schema_to_typespec(prop_schema)
            _ ->
              quote do: any()
          end
          
        true ->
          quote do: any()
      end
      
      quote do
        unquote(Macro.var(arg_name, nil)) :: unquote(type_spec)
      end
    end)
    
    # Build opts spec with specific optional parameters
    opts_spec = build_opts_spec(operation, body_schema)
    
    positional_specs ++ [opts_spec]
  end
  
  # Get the resolved request body schema
  defp get_request_body_schema(%Operation{request_body: nil}, _schemas), do: nil
  
  defp get_request_body_schema(%Operation{request_body: request_body}, schemas) do
    case request_body.content do
      %{"application/json" => %{"schema" => %{"$ref" => "#/components/schemas/" <> schema_name}}} ->
        case Map.get(schemas, schema_name) do
          %Schema{} = schema -> resolve_schema(schema, schemas)
          _ -> nil
        end
      _ -> nil
    end
  end
  
  # Resolve a schema, handling allOf merging (copied from PathModuleGenerator)
  defp resolve_schema(%Schema{all_of: all_of} = schema, schemas)
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

  defp resolve_schema(schema, _schemas), do: schema
  
  # Find a path parameter by name
  defp find_path_parameter(%Operation{parameters: nil}, _name), do: nil
  defp find_path_parameter(%Operation{parameters: params}, name) do
    Enum.find(params, fn param ->
      param.in == "path" && String.to_atom(param.name) == name
    end)
  end
  
  # Derive type from parameter schema
  defp derive_type_from_parameter(param) do
    case param.schema do
      %{"type" => "string"} -> quote do: String.t()
      %{"type" => "integer"} -> quote do: integer()
      %{"type" => "number"} -> quote do: number()
      %{"type" => "boolean"} -> quote do: boolean()
      _ -> quote do: any()
    end
  end
  
  # Build opts typespec with all optional parameters
  defp build_opts_spec(operation, body_schema) do
    # Collect all optional parameters from different sources
    query_params = get_query_parameters(operation)
    optional_body_params = get_optional_body_parameters(body_schema)
    
    # Build type specs for each optional parameter
    opt_types = []
    
    # Add query parameters
    opt_types = opt_types ++ Enum.map(query_params, fn param ->
      param_name = String.to_atom(param.name)
      param_type = derive_type_from_parameter(param)
      quote do
        {unquote(param_name), unquote(param_type)}
      end
    end)
    
    # Add optional body parameters
    opt_types = opt_types ++ Enum.map(optional_body_params, fn {name, schema} ->
      param_name = String.to_atom(name)
      param_type = TypespecGenerator.schema_to_typespec(schema)
      quote do
        {unquote(param_name), unquote(param_type)}
      end
    end)
    
    # If we have specific optional parameters, build a union type
    if length(opt_types) > 0 do
      # Build the union of all option tuples
      opts_union = case opt_types do
        [single] -> single
        [first | rest] ->
          Enum.reduce(rest, first, fn opt, acc ->
            quote do
              unquote(acc) | unquote(opt)
            end
          end)
      end
      
      quote do
        opts :: [unquote(opts_union)]
      end
    else
      # Fallback to generic keyword list
      quote do
        opts :: keyword()
      end
    end
  end
  
  # Get query parameters from operation
  defp get_query_parameters(%Operation{parameters: nil}), do: []
  defp get_query_parameters(%Operation{parameters: params}) do
    Enum.filter(params, fn p -> p.in == "query" end)
  end
  
  # Get optional body parameters (those not in required list)
  defp get_optional_body_parameters(nil), do: []
  defp get_optional_body_parameters(%Schema{properties: nil}), do: []
  defp get_optional_body_parameters(%Schema{properties: props, required: required}) do
    required_list = required || []
    
    props
    |> Enum.filter(fn {name, _schema} -> name not in required_list end)
    |> Enum.into([])
  end

  # Build return type specification
  defp build_return_spec(%Operation{} = _operation, function_name) do
    # Check if this is a streaming endpoint
    is_streaming = function_name
                   |> Atom.to_string()
                   |> String.ends_with?("_stream")
    
    if is_streaming do
      quote do
        {:ok, pid()} | {:error, any()}
      end
    else
      # TODO: Derive proper return type from response schemas
      quote do
        {:ok, map()} | {:error, any()}
      end
    end
  end
end