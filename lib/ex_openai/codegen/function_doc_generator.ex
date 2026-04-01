defmodule ExOpenAI.Codegen.FunctionDocGenerator do
  @moduledoc """
  Generates @doc and @spec attributes for OpenAPI operation functions.
  """

  alias ExOpenAI.Codegen.DocsParser.{Operation, Schema}
  alias ExOpenAI.Codegen.{TypespecGenerator, SchemaResolver}

  @doc """
  Generates @doc attribute for an operation.

  Uses the operation's summary and description, plus parameter documentation.
  """
  @spec generate_doc(Operation.t(), %{String.t() => Schema.t()}) :: Macro.t()
  def generate_doc(%Operation{} = operation, schemas \\ %{}) do
    doc_content = build_doc_content(operation, schemas)

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
    {param_specs, opts_type_ast} = build_spec_parts(operation, function_name, arg_names, schemas)
    return_spec = build_return_spec(operation, function_name, schemas)

    quote do
      unquote(opts_type_ast)
      @spec unquote(function_name)(unquote_splicing(param_specs)) :: unquote(return_spec)
    end
  end

  # Assemble the pieces needed for a generated `@spec`.
  #
  # We keep positional parameter specs inline, but emit a named local type for
  # `opts` when the endpoint has concrete option tuples. That keeps generated
  # specs readable while preserving the detailed option information Dialyzer can
  # use.
  @spec build_spec_parts(Operation.t(), atom(), [atom()], %{String.t() => Schema.t()}) ::
          {[Macro.t()], Macro.t() | nil}
  defp build_spec_parts(%Operation{} = operation, function_name, arg_names, schemas) do
    positional_args = Enum.filter(arg_names, &(&1 != :opts))
    body_schema = SchemaResolver.get_request_body_schema(operation.request_body, schemas)

    positional_specs =
      Enum.map(positional_args, fn arg_name ->
        build_positional_param_spec(operation, arg_name, body_schema, schemas)
      end)

    {opts_param_spec, opts_type_ast} =
      build_named_opts_spec(operation, function_name, body_schema, schemas)

    {positional_specs ++ [opts_param_spec], opts_type_ast}
  end

  # Build the documentation string
  defp build_doc_content(%Operation{} = operation, schemas) do
    sections = []

    # Add summary
    sections =
      if operation.summary do
        [operation.summary | sections]
      else
        sections
      end

    # Add description if different from summary
    sections =
      if operation.description && operation.description != operation.summary do
        sections ++ ["", operation.description]
      else
        sections
      end

    # Add comprehensive parameter documentation
    {params_section, opts_section} = build_comprehensive_parameter_docs(operation, schemas)

    sections =
      if params_section != "" do
        sections ++ ["", "## Parameters", "", params_section]
      else
        sections
      end

    sections =
      if opts_section != "" do
        sections ++ ["", "## Options", "", opts_section]
      else
        sections
      end

    Enum.join(sections, "\n")
  end

  @doc """
  Builds parameter type specifications for a function.

  Takes an operation and its argument names, and generates proper typespecs
  for each parameter. This includes:

  - Path parameters (from operation.parameters where in="path")
  - Required body parameters (from request body schema)
  - Optional parameters in the opts keyword list

  ## Parameters

    * `operation` - The Operation struct containing parameter definitions
    * `arg_names` - List of argument names (atoms) for the function
    * `schemas` - Map of component schemas for type resolution
    
  ## Returns

  A list of AST nodes representing the typespec for each parameter.

  ## Example

      iex> operation = %Operation{
      ...>   parameters: [%{name: "id", in: "path", schema: %{"type" => "string"}}],
      ...>   request_body: %{content: %{"application/json" => %{...}}}
      ...> }
      iex> build_param_specs(operation, [:id, :name, :opts], schemas)
      [{:"::", [], [{:id, [], nil}, {:remote_type, [], [...]}]}, ...]

  """
  @spec build_param_specs(Operation.t(), [atom()], %{String.t() => Schema.t()}) :: [Macro.t()]
  def build_param_specs(%Operation{} = operation, arg_names, schemas) do
    # Remove :opts from arg_names for now, we'll add it specially
    positional_args = Enum.filter(arg_names, &(&1 != :opts))

    # Get the resolved schema for the request body
    body_schema = SchemaResolver.get_request_body_schema(operation.request_body, schemas)

    # Build specs for positional arguments
    positional_specs =
      Enum.map(positional_args, fn arg_name ->
        build_positional_param_spec(operation, arg_name, body_schema, schemas)
      end)

    # Build opts spec with specific optional parameters
    opts_spec = build_opts_spec(operation, body_schema, schemas)

    positional_specs ++ [opts_spec]
  end

  # Build a local `@type ..._opt()` alias plus the `opts :: [...]` parameter
  # spec used in generated module specs.
  #
  # Example output:
  #
  #   @type create_chat_completion_opt() ::
  #     {:stream, boolean() | nil} | {:user, String.t()}
  #
  #   opts :: [create_chat_completion_opt()]
  #
  # We only emit the alias when the endpoint has known option tuples; generic
  # `keyword()` fallbacks stay inline.
  @spec build_named_opts_spec(Operation.t(), atom(), Schema.t() | nil, %{
          optional(String.t()) => Schema.t()
        }) :: {Macro.t(), Macro.t() | nil}
  defp build_named_opts_spec(operation, function_name, body_schema, schemas) do
    opt_types = build_option_tuple_types(operation, body_schema, schemas)

    if opt_types == [] do
      {quote(do: opts :: keyword()), nil}
    else
      opts_union = build_option_union_ast(opt_types)
      type_name = String.to_atom("#{function_name}_opt")
      local_type_ref = {type_name, [], []}

      opts_param_spec =
        quote do
          opts :: [unquote(local_type_ref)]
        end

      opts_type_ast =
        quote do
          @type unquote(type_name)() :: unquote(opts_union)
        end

      {opts_param_spec, opts_type_ast}
    end
  end

  @doc """
  Builds the typespec for a single positional parameter.

  Determines whether the parameter is a path parameter or body parameter
  and generates the appropriate typespec.

  ## Parameters

    * `operation` - The Operation struct
    * `arg_name` - The parameter name as an atom
    * `body_schema` - The resolved request body schema (may be nil)
    
  ## Returns

  An AST node representing the parameter typespec.
  """
  @spec build_positional_param_spec(
          Operation.t(),
          atom(),
          Schema.t() | nil,
          %{optional(String.t()) => Schema.t()}
        ) :: Macro.t()
  def build_positional_param_spec(operation, arg_name, body_schema, schemas) do
    type_spec = determine_param_type(operation, arg_name, body_schema, schemas)

    quote do
      unquote(Macro.var(arg_name, nil)) :: unquote(type_spec)
    end
  end

  @doc """
  Determines the type specification for a parameter.

  Checks if the parameter is a path parameter first, then checks if it's
  a body parameter. Returns the appropriate typespec AST.

  ## Parameters

    * `operation` - The Operation struct containing parameter definitions
    * `arg_name` - The parameter name as an atom
    * `body_schema` - The resolved request body schema (may be nil)
    
  ## Returns

  An AST node representing the type (e.g., `String.t()`, `integer()`, etc.)
  """
  @spec determine_param_type(
          Operation.t(),
          atom(),
          Schema.t() | nil,
          %{optional(String.t()) => Schema.t()}
        ) :: Macro.t()
  def determine_param_type(operation, arg_name, body_schema, schemas) do
    # Check if this is a path parameter
    path_param = find_path_parameter(operation, arg_name)

    cond do
      # Path parameter
      path_param != nil ->
        derive_type_from_parameter(path_param)

      # Body parameter - look it up in the resolved schema
      body_schema != nil && body_schema.properties != nil ->
        case Map.get(body_schema.properties, Atom.to_string(arg_name)) do
          %Schema{} = prop_schema ->
            TypespecGenerator.schema_to_typespec(prop_schema, schemas)

          _ ->
            quote do: any()
        end

      true ->
        quote do: any()
    end
  end

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
  defp build_opts_spec(operation, body_schema, schemas) do
    opt_types = build_option_tuple_types(operation, body_schema, schemas)

    # If we have specific optional parameters, build a union type
    if length(opt_types) > 0 do
      opts_union = build_option_union_ast(opt_types)

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

  # Build the list of `{option_name, option_type}` tuple ASTs used both by the
  # inline `build_opts_spec/3` helper tests and the named option alias emitted
  # by `generate_spec/4`.
  @spec build_option_tuple_types(Operation.t(), Schema.t() | nil, %{
          optional(String.t()) => Schema.t()
        }) :: [Macro.t()]
  defp build_option_tuple_types(operation, body_schema, schemas) do
    query_params = get_query_parameters(operation)
    optional_body_params = get_optional_body_parameters(body_schema)

    query_option_types =
      Enum.map(query_params, fn param ->
        param_name = String.to_atom(param.name)
        param_type = derive_type_from_parameter(param)

        quote do
          {unquote(param_name), unquote(param_type)}
        end
      end)

    body_option_types =
      Enum.map(optional_body_params, fn {name, schema} ->
        param_name = String.to_atom(name)
        param_type = TypespecGenerator.schema_to_typespec(schema, schemas)

        quote do
          {unquote(param_name), unquote(param_type)}
        end
      end)

    query_option_types ++ body_option_types
  end

  # Fold a list of option tuple AST nodes into the union used by both
  # `opts :: [...]` and the generated local `@type ..._opt()`.
  @spec build_option_union_ast([Macro.t()]) :: Macro.t()
  defp build_option_union_ast([single]), do: single

  defp build_option_union_ast([first | rest]) do
    Enum.reduce(rest, first, fn opt, acc ->
      quote do
        unquote(acc) | unquote(opt)
      end
    end)
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

  @doc """
  Builds the return type specification for a function.

  Determines the appropriate return type based on:
  - Response schemas defined in the operation
  - Whether the function is an explicit streaming helper (`*_stream`)
  - Whether the endpoint supports `stream: true` on the normal function

  ## Parameters

    * `operation` - The Operation struct containing response definitions
    * `function_name` - The function name (used to detect explicit streaming helpers)
    * `schemas` - Map of component schemas for type resolution
    
  ## Returns

  An AST node representing the return type, typically:
  - `{:ok, ComponentType.t()} | {:error, any()}` for normal endpoints
  - `{:ok, reference()} | {:error, any()}` for explicit streaming helpers
  - `{:ok, ComponentType.t() | reference()} | {:error, any()}` for endpoints
    that switch behavior with `stream: true`
  """
  @spec build_return_spec(Operation.t(), atom(), %{String.t() => Schema.t()}) :: Macro.t()
  def build_return_spec(%Operation{} = operation, function_name, schemas) do
    # `foo_stream/..` style helpers return the async HTTP reference directly.
    is_explicit_streaming =
      function_name
      |> Atom.to_string()
      |> String.ends_with?("_stream")

    if is_explicit_streaming do
      quote do
        {:ok, reference()} | {:error, any()}
      end
    else
      response_type = build_non_stream_ok_type(operation, schemas)

      if supports_streaming_option?(operation, schemas) do
        quote do
          {:ok, unquote(response_type) | reference()} | {:error, any()}
        end
      else
        quote do
          {:ok, unquote(response_type)} | {:error, any()}
        end
      end
    end
  end

  # Derive the normal non-streaming success type from the endpoint's
  # `application/json` response schema, falling back to `map()` when the schema
  # is absent.
  @spec build_non_stream_ok_type(Operation.t(), %{String.t() => Schema.t()}) :: Macro.t()
  defp build_non_stream_ok_type(%Operation{} = operation, schemas) do
    case get_response_schema(operation, "200", schemas) do
      %Schema{} = response_schema ->
        TypespecGenerator.schema_to_typespec(response_schema, schemas)

      nil ->
        quote do
          map()
        end
    end
  end

  # Detect whether the normal generated function supports `stream: true`.
  #
  # The generated runtime branch is driven by the presence of `:stream` in the
  # optional parameter list, so the spec generator needs the same check.
  defp supports_streaming_option?(%Operation{} = operation, schemas) do
    body_schema = SchemaResolver.get_request_body_schema(operation.request_body, schemas)

    query_params = get_query_parameters(operation)
    optional_body_params = get_optional_body_parameters(body_schema)

    Enum.any?(query_params, &(&1.name == "stream")) or
      Enum.any?(optional_body_params, fn {name, _schema} -> name == "stream" end)
  end

  # Extract and resolve the response schema for a given status code
  defp get_response_schema(%Operation{responses: nil}, _status_code, _schemas), do: nil

  defp get_response_schema(%Operation{responses: responses}, status_code, _schemas) do
    case Map.get(responses, status_code) do
      %{content: %{"application/json" => %{"schema" => %{"$ref" => ref}}}} ->
        # Return a schema with the ref so TypespecGenerator can create proper component reference
        %Schema{ref: ref}

      _ ->
        nil
    end
  end

  # Builds comprehensive parameter documentation for both positional and optional parameters.
  # Returns a tuple of {positional_params_doc, optional_params_doc}.
  @spec build_comprehensive_parameter_docs(Operation.t(), %{String.t() => Schema.t()}) ::
          {String.t(), String.t()}
  defp build_comprehensive_parameter_docs(%Operation{} = operation, schemas) do
    # Get the resolved request body schema
    body_schema = SchemaResolver.get_request_body_schema(operation.request_body, schemas)

    # Build positional parameter docs (path params + required body params)
    positional_docs = build_positional_parameter_docs(operation, body_schema, schemas)

    # Build optional parameter docs (query params + optional body params)
    optional_docs = build_optional_parameter_docs(operation, body_schema, schemas)

    {positional_docs, optional_docs}
  end

  @spec build_positional_parameter_docs(Operation.t(), Schema.t() | nil, %{
          String.t() => Schema.t()
        }) :: String.t()
  defp build_positional_parameter_docs(%Operation{} = operation, body_schema, schemas) do
    # Document path parameters
    path_params = get_path_parameters(operation)

    path_docs =
      Enum.map(path_params, fn param ->
        format_parameter_doc(param.name, param, true, :path, schemas)
      end)

    # Document required body parameters
    required_body_docs =
      if body_schema && body_schema.properties && body_schema.required do
        body_schema.required
        |> Enum.sort()
        |> Enum.map(fn prop_name ->
          prop_schema = Map.get(body_schema.properties, prop_name)

          if prop_schema do
            format_parameter_doc(prop_name, prop_schema, true, :body, schemas)
          else
            nil
          end
        end)
        |> Enum.filter(&(&1 != nil))
      else
        []
      end

    all_docs = path_docs ++ required_body_docs
    Enum.join(all_docs, "\n\n")
  end

  @spec build_optional_parameter_docs(Operation.t(), Schema.t() | nil, %{String.t() => Schema.t()}) ::
          String.t()
  defp build_optional_parameter_docs(%Operation{} = operation, body_schema, schemas) do
    docs = []

    # Document query parameters
    query_params = get_query_parameters(operation)

    query_docs =
      Enum.map(query_params, fn param ->
        format_parameter_doc(param.name, param, false, :query, schemas)
      end)

    docs = docs ++ query_docs

    # Document optional body parameters
    optional_body_params = get_optional_body_parameters(body_schema)

    optional_body_docs =
      Enum.map(optional_body_params, fn {name, schema} ->
        format_parameter_doc(name, schema, false, :body, schemas)
      end)

    docs = docs ++ optional_body_docs

    # Document header parameters
    header_params = get_header_parameters(operation)

    header_docs =
      Enum.map(header_params, fn param ->
        format_parameter_doc(param.name, param, false, :header, schemas)
      end)

    docs = docs ++ header_docs

    Enum.join(docs, "\n\n")
  end

  @spec format_parameter_doc(String.t(), any(), boolean(), atom(), %{String.t() => Schema.t()}) ::
          String.t()
  defp format_parameter_doc(name, param_or_schema, is_required, param_type, schemas) do
    param_name = if param_type == :body, do: name, else: ":#{name}"
    requirement = if is_required, do: "**required**", else: "**optional**"

    # Get type string
    type_str =
      case param_type do
        :path -> derive_type_string_from_parameter(param_or_schema)
        :query -> derive_type_string_from_parameter(param_or_schema)
        :header -> derive_type_string_from_parameter(param_or_schema)
        :body -> derive_type_string_from_schema(param_or_schema, schemas)
      end

    parts = ["* `#{param_name}` - #{requirement} - `#{type_str}`"]

    # Add description
    description =
      case param_or_schema do
        %{description: desc} when is_binary(desc) -> String.trim(desc)
        %Schema{description: desc} when is_binary(desc) -> String.trim(desc)
        _ -> nil
      end

    parts =
      if description do
        parts ++ ["  \n  #{description}"]
      else
        parts
      end

    # Add enum values
    enum_values =
      case param_or_schema do
        %Schema{enum: enum} when is_list(enum) and length(enum) > 0 -> enum
        %{schema: %{"enum" => enum}} when is_list(enum) and length(enum) > 0 -> enum
        _ -> nil
      end

    parts =
      if enum_values do
        values_str = Enum.map(enum_values, &"`#{inspect(&1)}`") |> Enum.join(", ")
        parts ++ ["  \n  Allowed values: #{values_str}"]
      else
        parts
      end

    # Add default value
    default =
      case param_or_schema do
        %{schema: %{"default" => default}} -> default
        %Schema{raw: %{"default" => default}} -> default
        _ -> nil
      end

    parts =
      if default != nil do
        parts ++ ["  \n  Default: `#{inspect(default)}`"]
      else
        parts
      end

    # Add format
    format =
      case param_or_schema do
        %{schema: %{"format" => format}} -> format
        %Schema{format: format} when is_binary(format) -> format
        _ -> nil
      end

    parts =
      if format do
        parts ++ ["  \n  Format: `#{format}`"]
      else
        parts
      end

    # Add constraints
    constraints = extract_parameter_constraints(param_or_schema)

    parts =
      if constraints != [] do
        constraint_str = Enum.join(constraints, ", ")
        parts ++ ["  \n  Constraints: #{constraint_str}"]
      else
        parts
      end

    # Add example if available
    example =
      case param_or_schema do
        %{example: ex} when not is_nil(ex) -> ex
        %Schema{example: ex} when not is_nil(ex) -> ex
        _ -> nil
      end

    parts =
      if example != nil do
        parts ++ ["  \n  Example: `#{inspect(example)}`"]
      else
        parts
      end

    Enum.join(parts)
  end

  defp derive_type_string_from_parameter(param) do
    case param.schema do
      %{"type" => "string"} -> "String.t()"
      %{"type" => "integer"} -> "integer()"
      %{"type" => "number"} -> "number()"
      %{"type" => "boolean"} -> "boolean()"
      %{"type" => "array", "items" => %{"type" => item_type}} -> "[#{type_to_elixir(item_type)}]"
      _ -> "any()"
    end
  end

  defp derive_type_string_from_schema(schema, _schemas) do
    try do
      typespec_ast = TypespecGenerator.schema_to_typespec(schema)
      ast_to_type_string(typespec_ast)
    rescue
      _ -> basic_schema_type_string(schema)
    end
  end

  defp ast_to_type_string({:|, _, types}) do
    types
    |> Enum.map(&ast_to_type_string/1)
    |> Enum.join(" | ")
  end

  defp ast_to_type_string({:__aliases__, _, parts}) do
    "#{Enum.join(parts, ".")}.t()"
  end

  defp ast_to_type_string({{:., _, [{:__aliases__, _, mod_parts}, :t]}, _, []}) do
    "#{Enum.join(mod_parts, ".")}.t()"
  end

  defp ast_to_type_string({:., _, [{:__aliases__, _, mod_parts}, :t]}) do
    "#{Enum.join(mod_parts, ".")}.t()"
  end

  defp ast_to_type_string({fun, _, []}) when is_atom(fun) do
    "#{fun}()"
  end

  defp ast_to_type_string({:list, _, [type]}) do
    "[#{ast_to_type_string(type)}]"
  end

  defp ast_to_type_string(nil) do
    "nil"
  end

  defp ast_to_type_string(atom) when is_atom(atom) do
    inspect(atom)
  end

  defp ast_to_type_string(_other) do
    "any()"
  end

  defp basic_schema_type_string(%Schema{ref: "#/components/schemas/" <> name}) do
    "ExOpenAI.Components.#{name}.t()"
  end

  defp basic_schema_type_string(%Schema{type: type}) when is_binary(type) do
    "#{type}()"
  end

  defp basic_schema_type_string(_) do
    "any()"
  end

  defp type_to_elixir("string"), do: "String.t()"
  defp type_to_elixir("integer"), do: "integer()"
  defp type_to_elixir("number"), do: "number()"
  defp type_to_elixir("boolean"), do: "boolean()"
  defp type_to_elixir(_), do: "any()"

  defp extract_parameter_constraints(param_or_schema) do
    constraints = []

    raw =
      case param_or_schema do
        %Schema{raw: raw} when is_map(raw) -> raw
        %{schema: schema} when is_map(schema) -> schema
        _ -> %{}
      end

    # Numeric constraints
    constraints =
      if Map.has_key?(raw, "minimum"),
        do: constraints ++ ["minimum: #{raw["minimum"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maximum"),
        do: constraints ++ ["maximum: #{raw["maximum"]}"],
        else: constraints

    # String constraints
    constraints =
      if Map.has_key?(raw, "minLength"),
        do: constraints ++ ["minLength: #{raw["minLength"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maxLength"),
        do: constraints ++ ["maxLength: #{raw["maxLength"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "pattern"),
        do: constraints ++ ["pattern: #{inspect(raw["pattern"])}"],
        else: constraints

    # Array constraints
    constraints =
      if Map.has_key?(raw, "minItems"),
        do: constraints ++ ["minItems: #{raw["minItems"]}"],
        else: constraints

    constraints =
      if Map.has_key?(raw, "maxItems"),
        do: constraints ++ ["maxItems: #{raw["maxItems"]}"],
        else: constraints

    constraints
  end

  # Get path parameters from operation
  defp get_path_parameters(%Operation{parameters: nil}), do: []

  defp get_path_parameters(%Operation{parameters: params}) do
    Enum.filter(params, fn p -> p.in == "path" end)
  end

  # Get header parameters from operation
  defp get_header_parameters(%Operation{parameters: nil}), do: []

  defp get_header_parameters(%Operation{parameters: params}) do
    Enum.filter(params, fn p -> p.in == "header" end)
  end
end
