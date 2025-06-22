defmodule ExOpenAI.Codegen.FunctionBodyGenerator do
  @moduledoc """
  Generates function body AST for OpenAPI operations.

  Handles URL building, parameter extraction, and HTTP client calls.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Parameter}

  @doc """
  Generates the function body AST for an operation.

  Takes the operation definition, the path string, and the list of argument names
  that were defined in the function signature.
  """
  @spec generate_body(Operation.t(), String.t(), [atom()]) :: Macro.t()
  def generate_body(%Operation{} = operation, path, arg_names) do
    # Extract parameter information
    {path_params, query_params, _body_params} = categorize_parameters(operation)

    # Determine HTTP method and content type
    http_method = determine_http_method(operation)
    content_type = determine_content_type(operation)

    # Build URL replacement statements
    url_replacements = path_params
    |> Enum.map(fn param ->
      param_name = String.to_atom(param.name)
      pattern = "{#{param.name}}"
      quote do
        url = String.replace(url, unquote(pattern), to_string(unquote(Macro.var(param_name, nil))))
      end
    end)
    
    # Extract query parameter names
    query_param_names = Enum.map(query_params, fn p -> String.to_atom(p.name) end)
    
    # Extract body argument names (non-path, non-opts arguments)
    path_param_names = Enum.map(path_params, fn p -> String.to_atom(p.name) end)
    body_arg_names = arg_names 
    |> Enum.filter(fn name -> 
      name != :opts and name not in path_param_names
    end)
    
    # Build body parameter assignments
    body_param_assignments = body_arg_names
    |> Enum.map(fn name ->
      quote do
        {unquote(name), unquote(Macro.var(name, nil))}
      end
    end)
    
    # Generate AST variable for opts
    opts_var = Macro.var(:opts, nil)
    
    quote do
      # Debug logging
      IO.puts("Function called with args: #{inspect(binding())}")
      
      # Start with the base URL
      url = unquote(path)
      
      # Replace path parameters
      unquote_splicing(url_replacements)
      
      # Build query string from opts
      query_params = Keyword.take(unquote(opts_var), unquote(query_param_names))
      IO.puts("Query params extracted: #{inspect(query_params)}")
      
      query_string = if length(query_params) > 0 do
        "?" <> URI.encode_query(query_params)
      else
        ""
      end
      
      # Append query string
      url = url <> query_string
      IO.puts("Final URL: #{url}")
      
      # Build body parameters
      body_params = [unquote_splicing(body_param_assignments)]
      
      IO.puts("Body params: #{inspect(body_params)}")
      IO.puts("HTTP method: #{unquote(http_method)}")
      
      # Simple convert function for now
      convert_response = fn response -> response end
      
      # Make the HTTP call
      ExOpenAI.Config.http_client().api_call(
        unquote(http_method),
        url,
        body_params,
        unquote(content_type),
        unquote(opts_var),
        convert_response
      )
    end
  end

  # Categorize parameters by their location (path, query, body)
  def categorize_parameters(%Operation{parameters: params}) do
    params = params || []

    path_params = Enum.filter(params, &(&1.in == "path"))
    query_params = Enum.filter(params, &(&1.in == "query"))
    # Note: OpenAPI doesn't have "body" in parameters, body params come from requestBody
    body_params = []

    {path_params, query_params, body_params}
  end

  # Determine HTTP method from operation
  def determine_http_method(%Operation{method: method}) do
    String.to_atom(method)
  end

  # Determine content type from request body
  def determine_content_type(%Operation{request_body: nil}) do
    :"application/json"
  end

  def determine_content_type(%Operation{request_body: request_body}) do
    case request_body.content do
      %{"multipart/form-data" => _} -> :"multipart/form-data"
      _ -> :"application/json"
    end
  end
end
