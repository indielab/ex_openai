defmodule ExOpenAI.Codegen.FunctionBodyGenerator do
  @moduledoc """
  Generates function body AST for OpenAPI operations.

  This module is primarily exercised via unit tests and mirrors the
  high‑level behaviour documented in `docs/parsingv2.md`:

  - Replaces path parameters in the URL using `String.replace/3`
  - Builds query strings from `opts` using `URI.encode_www_form/1`
  - Collects body parameters from the non‑`opts` function arguments
  - Delegates the HTTP call to `ExOpenAI.Config.http_client().api_call/6`

  In the current v2 codegen the real, production function bodies are
  generated inline in `PathModuleGenerator`. `generate_body/3` exists as
  a focused unit under test that captures the same ideas without being
  wired into the runtime generator.
  """

  alias ExOpenAI.Codegen.DocsParser.Operation

  @doc """
  Generates the function body AST for an operation.

  The `arg_asts` parameter is the list of argument AST nodes that would
  appear in a function head, e.g. `[quote(do: item_id), quote(do: opts)]`.

  The generated body:
  - Captures arguments via `binding/0` into `all_args`
  - Replaces any `{path_param}` segments using `Keyword.get(all_args, name)`
  - Builds a query string from query parameters present in `all_args`
  - Builds `body_params` from non‑path, non‑`opts` arguments
  - Calls `api_call/6` with `&Function.identity/1` as the converter
  """
  @spec generate_body(Operation.t(), String.t(), [Macro.t()]) :: Macro.t()
  def generate_body(%Operation{} = operation, path, arg_asts) when is_list(arg_asts) do
    {path_params, query_params, _body_params} = categorize_parameters(operation)

    http_method = determine_http_method(operation)
    content_type = determine_content_type(operation)

    # Extract raw argument names (atoms) from the AST
    arg_names =
      Enum.map(arg_asts, fn
        {name, _meta, _ctx} when is_atom(name) -> name
      end)

    # Last argument is always the opts keyword list
    opts_name = List.last(arg_names)

    path_param_names = Enum.map(path_params, fn p -> String.to_atom(p.name) end)
    query_param_names = Enum.map(query_params, fn p -> String.to_atom(p.name) end)

    # Body args are all non‑path args except opts
    body_arg_names =
      arg_names
      |> Enum.filter(fn name -> name not in path_param_names and name != opts_name end)

    # Replace {param} segments in the URL using Keyword.get(all_args, ...)
    url_replacements =
      Enum.map(path_params, fn param ->
        param_name = String.to_atom(param.name)
        pattern = "{#{param.name}}"

        quote do
          url =
            String.replace(
              url,
              unquote(pattern),
              to_string(Keyword.get(all_args, unquote(param_name)))
            )
        end
      end)

    # Build body_params from non‑path positional args using all_args
    body_param_assignments =
      Enum.map(body_arg_names, fn name ->
        quote do
          {unquote(name), Keyword.get(all_args, unquote(name))}
        end
      end)

    quote do
      # Capture all arguments as a keyword list
      all_args = binding()

      # Start with the base URL
      url = unquote(path)

      # Replace path parameters
      unquote_splicing(url_replacements)

      # Build query params from all_args
      query_params =
        unquote(query_param_names)
        |> Enum.map(fn key -> {key, Keyword.get(all_args, key)} end)
        |> Enum.filter(fn {_k, v} -> not is_nil(v) end)

      query_string =
        if length(query_params) > 0 do
          URI.encode_www_form(query_params)
        else
          ""
        end

      final_url =
        if query_string == "" do
          url
        else
          url <> "?" <> query_string
        end

      # Build body parameters from non‑path, non‑opts args
      body_params = [unquote_splicing(body_param_assignments)]

      # Extract opts from captured args
      opts = Keyword.get(all_args, unquote(opts_name))

      ExOpenAI.Config.http_client().api_call(
        unquote(http_method),
        final_url,
        body_params,
        unquote(content_type),
        opts,
        &Function.identity/1
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
