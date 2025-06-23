defmodule ExOpenAI.Codegen.FunctionDocGenerator do
  @moduledoc """
  Generates @doc and @spec attributes for OpenAPI operation functions.
  """

  alias ExOpenAI.Codegen.DocsParser.Operation

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
  @spec generate_spec(Operation.t(), atom(), [atom()]) :: Macro.t()
  def generate_spec(%Operation{} = operation, function_name, arg_names) do
    param_specs = build_param_specs(operation, arg_names)
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
  defp build_param_specs(%Operation{} = _operation, arg_names) do
    # Remove :opts from arg_names for now, we'll add it specially
    positional_args = Enum.filter(arg_names, &(&1 != :opts))
    
    # Build specs for positional arguments
    positional_specs = Enum.map(positional_args, fn arg_name ->
      # For now, use any() for all positional args
      # TODO: Derive proper types from schemas
      quote do
        unquote(Macro.var(arg_name, nil)) :: any()
      end
    end)
    
    # Always add opts as keyword list at the end
    opts_spec = quote do
      opts :: keyword()
    end
    
    positional_specs ++ [opts_spec]
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