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
  @spec generate_body(Operation.t(), String.t(), [Macro.t()]) :: Macro.t()
  def generate_body(%Operation{} = operation, path, arg_names) do
    # Extract parameter information
    {path_params, query_params, _body_params} = categorize_parameters(operation)
    
    # Determine HTTP method and content type
    http_method = determine_http_method(operation)
    content_type = determine_content_type(operation)
    
    # For now, just generate a simple body to test compilation
    quote do
      # Simple placeholder implementation
      {:ok, "Not implemented yet"}
    end
  end

  # Categorize parameters by their location (path, query, body)
  defp categorize_parameters(%Operation{parameters: params}) do
    params = params || []
    
    path_params = Enum.filter(params, &(&1.in == "path"))
    query_params = Enum.filter(params, &(&1.in == "query"))
    # Note: OpenAPI doesn't have "body" in parameters, body params come from requestBody
    body_params = []
    
    {path_params, query_params, body_params}
  end


  # Determine HTTP method from operation
  defp determine_http_method(%Operation{method: method}) do
    String.to_atom(method)
  end

  # Determine content type from request body
  defp determine_content_type(%Operation{request_body: nil}) do
    :"application/json"
  end
  
  defp determine_content_type(%Operation{request_body: request_body}) do
    case request_body.content do
      %{"multipart/form-data" => _} -> :"multipart/form-data"
      _ -> :"application/json"
    end
  end
end