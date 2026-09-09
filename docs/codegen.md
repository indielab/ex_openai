# Understanding ex_openai Code Generation Architecture

## Overview

The `ex_openai` library is an Elixir SDK for the OpenAI API that uses metaprogramming to generate most of its code from OpenAI's API specification. When the specification changes, the generators can produce the corresponding structs, typespecs, documentation, and endpoint functions.

This guide follows that process step by step, from a YAML schema to the code that handles a response. The examples use `/completions` to keep the running example small; the same generators handle Chat, Responses, and the other API groups.

There are three stages to keep track of:

```text
docs.yaml + overlay.yaml -> parsed Schema/Path structs -> quoted Elixir AST -> generated .ex files
                                                                    |
                                                               mix compile
                                                                    |
                                                               BEAM modules
                                                                    |
                                                        API call and conversion
```

The generator runs when you invoke `mix generate_openai_sources`. Its output is committed under `lib/ex_openai/generated` and compiled as ordinary Elixir source. An application using the SDK calls those compiled functions without parsing YAML or generating modules at runtime.

## Code Generation Process - Step by Step

### 1. Reading and Parsing "docs.yaml"

The process begins with parsing OpenAI's API specification, stored as a YAML file at `lib/ex_openai/docs/docs.yaml`. `SourceFileGenerator.load_documentation/0` reads the upstream file and the SDK-owned `lib/ex_openai/docs/overlay.yaml`, then passes them to `DocsParser.get_documentation/2`. The overlay adds missing definitions to the decoded map before it becomes typed structs. `DocsParser.get_documentation/1` still parses a document without corrections.

You can follow the executable Elixir examples in order from the repository root with `mise exec -- iex -S mix`. They inspect or construct code without making API requests. Blocks marked as text show abbreviated output.

```elixir
alias ExOpenAI.Codegen.DocsParser.Schema
alias ExOpenAI.Codegen.{
  ComponentModuleGenerator,
  PathModuleGenerator,
  ResponseConverter,
  SchemaResolver,
  SourceFileGenerator,
  TypespecGenerator
}

documentation = SourceFileGenerator.load_documentation()
```

**Short Example:**

The `/completions` operation contains references to its request and response schemas. This excerpt leaves out descriptions and unrelated fields:

```yaml
paths:
  /completions:
    post:
      operationId: createCompletion
      requestBody:
        required: true
        content:
          application/json:
            schema:
              $ref: '#/components/schemas/CreateCompletionRequest'
      responses:
        "200":
          description: OK
          content:
            application/json:
              schema:
                $ref: '#/components/schemas/CreateCompletionResponse'
```

`DocsParser` first loads YAML into string-keyed maps. It then builds a `Documentation` struct containing two mappings:

- `components` maps schema names to `%Schema{}` values.
- `paths` maps URL paths to `%ExOpenAI.Codegen.DocsParser.Path{}` values, each containing its operations.

```elixir
completion_path = documentation.paths["/completions"]
completion_operation = completion_path.operations["post"]

IO.inspect(completion_operation.operation_id)
IO.inspect(documentation.components["CreateCompletionRequest"].required)
```

```text
"createCompletion"
["model", "prompt"]
```

The parser preserves a `$ref` as a reference. Resolving it is a later operation, so parsing one schema does not require expanding every other schema it mentions.

The overlay keeps API-specific corrections outside the generic parser and generators.
Each entry names an existing map with a `target` list and declares new fields in
`add`. For example, the transcription correction adds `text/plain` under the
operation's successful response content while retaining its JSON schema.

`SchemaOverlay.apply!/2` requires every target to exist and every added field to
be absent. If an upstream update removes a target or supplies a field, generation
fails with the affected path. Review that correction against the new upstream
schema and remove or adjust the overlay entry before regenerating.

Streaming behavior comes from the response schemas. A `text/event-stream`
response enables the SDK's `stream` option. To decide whether callbacks need the
SSE envelope, the resolver follows component references and union members and
checks that every variant requires a string `event` field and a `data` field.
Payload schemas without that shape are passed to the converter without wrapping.

Request format options remain caller-controlled. For example, speech streaming
requires both `stream: true` and `stream_format: :sse`; the generator does not
choose a request format on the caller's behalf.

The response resolver combines schemas from all successful non-SSE media types.
SSE schemas are selected separately for callback conversion.

### 2. Converting Raw JSON Schema Types

`Schema.parse_schema/2` converts each JSON Schema node into a `%Schema{}`. It calls itself recursively for properties, array items, and the members of `oneOf`, `anyOf`, and `allOf`.

**Short Example:**

To see array recursion in isolation, consider a small array-of-strings schema:

```json
{
  "type": "array",
  "items": {
    "type": "string"
  }
}
```

```elixir
array_schema = Schema.parse_schema("example", %{
  "type" => "array",
  "items" => %{"type" => "string"}
})

IO.inspect({array_schema.type, array_schema.items.type})
```

```text
{"array", "string"}
```

The intermediate representation is a tree. The outer node has `type: "array"`; its `items` field holds another `%Schema{type: "string"}`. The same recursion applies to object properties.

For a real enum in the bundled specification, inspect the role on a user message:

```elixir
role_schema = documentation.components["ChatCompletionRequestUserMessage"].properties["role"]
IO.inspect({role_schema.type, role_schema.enum})
```

```text
{"string", ["user"]}
```

At this stage the enum values are still strings. Atom literals such as `:user` are introduced when building the Elixir typespec. Keeping parsing separate from code generation lets the same schema tree support input types, response types, and field documentation.

Each node also retains its original map in `raw`. The documentation generator uses it for constraints and details that do not have a dedicated struct field.

### 3. Creating a Normalized Component Schema

Component schemas retain their properties and their `required` list. The request resolver looks up the selected representation's schema and merges object composition where necessary:

```elixir
request_schema = SchemaResolver.get_request_body_schema(
  completion_operation.request_body,
  documentation.components
)

{required_props, optional_props} =
  request_schema.properties
  |> Enum.sort_by(&elem(&1, 0))
  |> Enum.split_with(fn {name, _schema} -> name in request_schema.required end)

IO.inspect(Enum.map(required_props, &elem(&1, 0)))
IO.inspect(Enum.any?(optional_props, fn {name, _} -> name == "max_tokens" end))
```

```text
["model", "prompt"]
true
```

Notice how the required and optional properties come from the `required` array in the YAML definition. This division is used when constructing input maps and function arguments, but the request body's own `required` flag also matters.

For `/completions`, the body is required, so its required properties become positional arguments. If a request body is optional, all its properties remain keyword options, even if the schema marks some properties as required. That distinction lets a caller omit the entire optional body. The generated function does not perform runtime schema validation if the caller supplies an incomplete body.

`allOf` has a different meaning from `oneOf` and `anyOf`:

- `SchemaResolver.resolve_schema/2` merges properties and required fields from object `allOf` members into one object schema.
- `oneOf` and `anyOf` retain their alternatives and become Elixir union types. An Elixir union does not enforce JSON Schema's distinction between matching exactly one alternative and matching at least one.

The resolver handles both component references and inline request schemas. It also selects the representation used by the generated request. When both multipart and JSON are offered, it selects multipart, so the argument schema and the HTTP encoding describe the same request.

### 4. Extracting Endpoint Definitions

`Path.parse_paths/1` creates the path mapping. Each HTTP operation becomes an `%Operation{}` with an operation ID, method, parameters, request body, and responses.

**Short Example:**

The parsed operation from the first section exposes its body and response references:

```elixir
IO.inspect(%{
  path: completion_path.path,
  method: completion_operation.method,
  operation_id: completion_operation.operation_id,
  required_body?: completion_operation.request_body.required,
  request_ref: completion_operation.request_body.content["application/json"]["schema"]["$ref"],
  response_ref: completion_operation.responses["200"].content["application/json"]["schema"]["$ref"]
})
```

```text
%{
  path: "/completions",
  method: "post",
  operation_id: "createCompletion",
  required_body?: true,
  request_ref: "#/components/schemas/CreateCompletionRequest",
  response_ref: "#/components/schemas/CreateCompletionResponse"
}
```

`PathModuleGenerator` uses `operation_id` to name the function and the first URL path segment to choose the module. `/completions` becomes `ExOpenAI.Completions`; `/chat/completions` belongs to `ExOpenAI.Chat`. Grouping uses the URI path, so a query suffix in the specification is not part of the module name.

Parsing an HTTP method and implementing its transport are separate concerns. The parser recognizes OpenAPI operation keys; `FunctionBodyGenerator.determine_http_method/1` and `Client.api_call/6` implement the GET, POST, and DELETE dispatch used by the current SDK. A newly specified method needs corresponding transport support.

`SchemaResolver.response_schema/3` selects documented 2xx responses. When there are several distinct success schemas, it returns a union. Streaming schema selection is separate because a completed response and an SSE event can have different shapes.

### 5. Type Spec Generation

After parsing types, `TypespecGenerator` converts them into Elixir typespec AST. An AST is ordinary Elixir data representing code, so the generator can assemble it before the compiler sees a module definition.

```elixir
integer_ast = quote do: integer()
list_ast = quote do: list(unquote(integer_ast))

IO.puts(Macro.to_string(list_ast))
```

```text
list(integer())
```

`quote` returns the syntax tree for its body. `unquote(integer_ast)` inserts the previously built tree into that body. It does not call `integer/0`; that syntax will become part of a typespec in the generated module.

Most generator entry points are ordinary functions returning AST as data. They do not need to be macros: the generation task calls them and decides when to render and write their results. A `defmacro`, such as the `__using__/1` implementations discussed below, returns AST for the compiler to expand at its call site. `Macro.to_string/1` only renders a tree; it does not execute or compile it.

The type generator applies this recursively:

```elixir
array_type_ast = TypespecGenerator.schema_to_typespec(array_schema)
IO.puts(Macro.to_string(array_type_ast))

max_tokens_type_ast = TypespecGenerator.schema_to_typespec(request_schema.properties["max_tokens"])
IO.puts(Macro.to_string(max_tokens_type_ast))
```

```text
list(String.t())
integer() | nil
```

The nullable wrapper comes from the schema's `nullable` flag. An explicit JSON Schema `type: "null"` also becomes `nil`. It must remain a specific union member: `String.t() | any()` would allow every value and lose the intended constraint.

For an enum, the generator joins literal atoms with `|`. For a reference, it builds a remote type call:

```elixir
response_ref = %Schema{ref: "#/components/schemas/CreateCompletionResponse"}
response_type_ast = TypespecGenerator.schema_to_typespec(response_ref)
IO.puts(Macro.to_string(response_type_ast))
```

```text
ExOpenAI.Components.CreateCompletionResponse.t()
```

The result is code for a type reference. Resolving that reference into a struct value happens later, when a response arrives.

#### Input types and response types

`schema_to_typespec/2` describes response values. `schema_to_input_typespec/2` describes values accepted by generated calls. For example, the input type for an enum also permits strings, and a file input can be either bytes or a filename/content tuple.

```elixir
IO.puts(Macro.to_string(TypespecGenerator.schema_to_typespec(role_schema)))
IO.puts(Macro.to_string(TypespecGenerator.schema_to_input_typespec(role_schema)))
```

```text
:user
:user | String.t()
```

Object inputs can be atom-keyed maps as well as component structs. Referenced input types therefore use `Component.input()`, while response types use `Component.t()`.

These specs help Dialyzer detect definite errors, but they do not validate values at runtime. Large keyword option types and deeply nested unions can still admit calls Dialyzer cannot prove invalid. A type that permits enum strings also cannot restrict those strings to a set of literal values.

### 6. Generating Modules for Components

For each object component with declared properties, `ComponentModuleGenerator.generate_module/2` builds the AST for an Elixir module with a struct. Enum, union, array, and other non-struct components get modules containing type aliases.

**Short Example:**

Generate and inspect the module for the completion request:

```elixir
component_ast = ComponentModuleGenerator.generate_module(
  request_schema,
  documentation.components
)

component_source = Macro.to_string(component_ast)
IO.puts(component_source)
```

This prints a module definition containing `use ExOpenAI.Jason`, `@moduledoc`, `@type t()`, `@type input()`, and `defstruct`. The generated module has one field per schema property, including `model`, `prompt`, and `max_tokens`.

The same construction can be examined in a smaller teaching example:

```elixir
module_name = CodegenWalkthrough.CompletionRequest
struct_fields = [:model, :prompt, :max_tokens]
field_types = [
  model: quote(do: String.t()),
  prompt: quote(do: String.t()),
  max_tokens: quote(do: integer() | nil)
]

small_component_ast = quote do
  defmodule unquote(module_name) do
    @type t() :: %__MODULE__{unquote_splicing(field_types)}
    defstruct unquote(struct_fields)
  end
end

IO.puts(Macro.to_string(small_component_ast))
```

Here the simplified model and prompt types keep the example focused on AST construction; the actual completion schema accepts more alternatives. This example returns AST without compiling a module.

`unquote(struct_fields)` inserts one list value into `defstruct`. `unquote_splicing(field_types)` inserts the list's entries individually into the struct typespec. The same distinction is used when inserting multiple function definitions into a module body.

The production generator builds the struct type's map AST explicitly:

```elixir
struct_type_ast = {:%{}, [], [{:__struct__, {:__MODULE__, [], Elixir}} | field_types]}
type_declaration_ast = quote do
  @type t() :: unquote(struct_type_ast)
end

IO.puts(Macro.to_string(type_declaration_ast))
```

The `:%{}` tuple represents map syntax; its entries include the struct identity and each field's type. Optional struct fields include `nil` in `t()` because `defstruct` gives them a default of `nil`. The generated modules do not use `@enforce_keys`, so constructing a struct does not enforce the schema's required fields.

A type alias module has no `defstruct`. For example, `ServiceTier.t()` represents an enum union. Response conversion must expand that alias instead of trying to instantiate `%ServiceTier{}`.

#### Trying the AST in memory

You can compile the small teaching module to see how its AST becomes a usable module:

```elixir
compiled_modules = Code.compile_quoted(small_component_ast)
{compiled_module, _beam_binary} = List.keyfind(compiled_modules, module_name, 0)

example_request = struct(compiled_module, model: "example-model", prompt: "Say hello")
IO.inspect(Map.from_struct(example_request))
```

```text
%{model: "example-model", prompt: "Say hello", max_tokens: nil}
```

`Code.compile_quoted/1` returns module names and BEAM binaries and loads the modules in the current VM. This example does not write a BEAM file into `_build`. The SDK's production generator writes `.ex` files instead, making its output available for source review and normal Mix compilation.

#### What `use ExOpenAI.Jason` expands into

`use` invokes the target module's `__using__/1` macro. `ExOpenAI.Jason` returns quoted code implementing `Jason.Encoder` for the generated struct. The encoder omits `:__struct__` and fields whose value is `nil`, then encodes the remaining fields as a JSON object.

This is a second use of metaprogramming: the generator produces `use ExOpenAI.Jason` in a source file, and the Elixir compiler expands that macro when compiling the file. Type alias modules do not need an encoder because their values are ordinary strings, atoms, lists, or maps.

### 7. Generating Endpoint Modules and Functions

API functions are grouped by their path prefix, and a module is generated for each group. The module generator combines the documentation, specs, arguments, and function bodies for its operations.

```elixir
endpoint_ast = PathModuleGenerator.generate_module(
  "completions",
  [completion_path],
  documentation.components
)

IO.puts(Macro.to_string(endpoint_ast))
```

For the running example, the emitted function is `create_completion(model, prompt, opts \\ [])`. Its default argument gives callers both `/2` and `/3` arities. Positional arguments are sorted alphabetically. The request body's required `model` and `prompt` properties therefore appear in that order.

For each function, the generator creates:

- Documentation with parameter descriptions and examples.
- Type specifications for positional arguments and a named keyword-option type.
- Return type specifications based on success and streaming schemas.
- The implementation that builds and sends the request.

#### Building a function head

The function's argument names are data while the generator is running. `Macro.var/2` turns each name into variable AST that can be inserted into a function head and its body:

```elixir
function_name = :create_completion
arg_names = [:model, :prompt]
args = Enum.map(arg_names, &Macro.var(&1, nil))
model_arg = Macro.var(:model, nil)
prompt_arg = Macro.var(:prompt, nil)

head_example_ast = quote do
  def unquote(function_name)(unquote_splicing(args)) do
    [model: unquote(model_arg), prompt: unquote(prompt_arg)]
  end
end

IO.puts(Macro.to_string(head_example_ast))
```

```text
def create_completion(model, prompt) do
  [model: model, prompt: prompt]
end
```

Elixir's quoted variables carry a context for macro hygiene. A variable called `model` created in one quoting context is not automatically the same binding as a variable with that name created in another context. The generator uses `Macro.var(name, nil)` consistently for dynamic parameters so references in the emitted body bind to the emitted arguments.

`PathModuleGenerator` constructs the production body inline within its function quote. `FunctionBodyGenerator` supplies helpers such as parameter categorization and method selection; its separate `generate_body/3` is not the production body's entry point. When changing emitted request logic, inspect `PathModuleGenerator.generate_function/3`.

#### Embedding data with `Macro.escape/1`

A parsed schema is a struct value, whereas the body of `quote` expects syntax. `Macro.escape/1` converts a data value into the syntax needed to recreate it. For example, we can embed our response reference in a converter:

```elixir
escaped_schema_ast = Macro.escape(response_ref)
converter_ast = quote do
  fn response ->
    ExOpenAI.Codegen.ResponseConverter.convert_response(
      response,
      unquote(escaped_schema_ast)
    )
  end
end

IO.puts(Macro.to_string(converter_ast))
```

`Macro.escape` produces the syntax needed to reconstruct the schema value. `unquote` then inserts that syntax into the function.

The production `schema_ast/1` builds a compact struct literal directly. It includes fields needed for conversion, recursively constructs nested schemas, and leaves out fields such as documentation and raw source data. For a simple reference, its construction looks like this:

```elixir
schema_module_ast = {:__aliases__, [alias: false], [:ExOpenAI, :Codegen, :DocsParser, :Schema]}
compact_schema_ast = {:%, [], [schema_module_ast, {:%{}, [], [ref: response_ref.ref]}]}

IO.puts(Macro.to_string(compact_schema_ast))
```

```text
%ExOpenAI.Codegen.DocsParser.Schema{ref: "#/components/schemas/CreateCompletionResponse"}
```

For literal metadata such as discriminator maps, `schema_ast/1` delegates to `literal_ast/1`, which uses `Macro.escape/1`. Both techniques put schema data into the endpoint module, so a runtime call can use the selected schema without reopening `docs.yaml`.

Every endpoint's option type includes `ExOpenAI.request_option()`, which describes per-request authentication, base URL, receiver, and HTTP settings. The body schema supplies API options such as `max_tokens` and `stream`. For streaming-capable operations, the generated function selects a streaming converter when `stream: true` is present.

#### Writing and compiling the result

`SourceFileGenerator.sources/0` returns a map of target filenames to rendered source. It constructs component and endpoint ASTs, renders them with `Macro.to_string/1`, rewrites documentation attributes, and formats the source with `Code.format_string!/1`.

The documentation rewrite escapes interpolation and heredoc delimiters so text from the specification is emitted as literal documentation. It also makes OpenAI documentation links absolute. Module docs remain visible to ExDoc, and type descriptions are rendered as readable type expressions rather than raw AST tuples.

`write_all!/0` writes those sources and removes stale generated files. Only the generation command performs those writes. `mix compile` then compiles the committed `.ex` files, including their macros and typespec metadata.

### 8. Request Processing

Once compiled, a generated function is an ordinary Elixir function. It builds the request using the arguments and schemas selected during generation:

1. Put positional body arguments into a keyword list.
2. Substitute path arguments into the URL.
3. Take known query options and append them to the URL.
4. Add known optional body fields to the body list.
5. Remove API parameters from the remaining HTTP options, retaining `stream` for transport setup.
6. Pass the request and its conversion callback to the configured client.

**Short Example:**

Here is the body assembly for a completion request, reduced to a few parameters:

```elixir
model = "gpt-3.5-turbo-instruct"
prompt = "Say hello"
opts = [max_tokens: 16, openai_api_key: "example-key"]

body_params = [model: model, prompt: prompt] ++ Keyword.take(opts, [:max_tokens])
http_opts = Keyword.drop(opts, [:max_tokens])

IO.inspect(body_params)
IO.inspect(Keyword.keys(http_opts))
```

```text
[model: "gpt-3.5-turbo-instruct", prompt: "Say hello", max_tokens: 16]
[:openai_api_key]
```

In the full generated function, those lists of recognized names come from the parsed operation. This matters because the final keyword argument combines API input with transport configuration. An authentication override must not become a JSON body field, and a body parameter must not disappear into HTTP client options.

Query parameters go through `ExOpenAI.Query.append/2`. It handles scalar values, arrays, and nested maps using bracketed keys, and preserves an existing query:

```elixir
IO.puts(ExOpenAI.Query.append(
  "/responses/resp_1?beta=true",
  include: ["message.output_text.logprobs"]
))
```

```text
/responses/resp_1?beta=true&include%5B%5D=message.output_text.logprobs
```

For multipart requests, generation identifies file fields and explicit part encodings from the selected schema. The emitted body calls `Client.prepare_multipart/3` before dispatch, allowing raw bytes and filename/content tuples to carry file metadata. Structured fields and arrays are then encoded by the multipart client.

The final call is `ExOpenAI.Config.http_client().api_call/6`, with the method, URL, body parameters, content type, HTTP options, and response converter. A capturing client can inspect these arguments in tests without making an external request.

### 9. Client Implementation

The API client (`ExOpenAI.Client`) handles the actual HTTP requests. For a JSON POST it converts the keyword body to a map, strips configuration-only fields, and encodes it with Jason. It then applies configured headers, authentication, base URL, and HTTP options before calling HTTPoison.

Generated calls pass schema headers in `:request_headers`, raw-body selection in `:response_mode`, and Assistants SSE wrapping in `:event_envelope`. Custom transports that do not delegate to `ExOpenAI.Client` must honor these options before invoking the response converter.

Response processing has two layers:

1. `Client` interprets HTTP results. It treats 2xx statuses as successful, decodes `application/json` bodies unless the generated call marks a successful response as raw, and preserves bytes for other content types. A downloaded JSON-looking file must retain its exact contents.
2. The endpoint's converter interprets the successful payload using the schema selected during generation.

**Short Example:**

Use a small completion payload to inspect the second layer without HTTP:

```elixir
payload = %{
  "id" => "cmpl_example",
  "object" => "text_completion",
  "created" => 0,
  "model" => "example-model",
  "choices" => [%{"text" => "Hello", "index" => 0, "finish_reason" => "stop"}]
}

{:ok, completion} = ResponseConverter.convert_response({:ok, payload}, response_ref)
IO.inspect(completion.__struct__)
IO.inspect(hd(completion.choices).text)
```

```text
ExOpenAI.Components.CreateCompletionResponse
"Hello"
```

The converter looks up the referenced component module, reads its fields and compiled `t()` definition, and converts known nested values. This is why typespec generation and response conversion need to agree on component references, enums, and union shapes.

### 10. Streaming Support

Streaming uses a generated conversion callback too, but it runs for each event. For Chat, a completed response and a streaming chunk have different component types. Responses streams use event types such as `ResponseTextDeltaEvent` and `ResponseCompletedEvent`.

When the request has `stream: true` and a valid `stream_to` receiver, `Client.stream_options/2` starts a `StreamingClient` helper and passes its PID to HTTPoison. The public API call returns `{:ok, reference()}`. The helper accumulates transport chunks until it has complete SSE messages, decodes their payloads, and calls the generated converter.

This supports:

- One-argument callbacks receiving `{:data, chunk}`, `{:error, reason}`, or `:finish`.
- Receiver processes getting the same events through `GenServer.cast/2`.
- Conversion of event payloads into their declared component types.

A `response.completed` event retains its event type, sequence number, and nested response. The envelope is part of the event schema and is needed to distinguish it from other events in the stream.

The HTTP helper stops on completion or terminal failure. Normal completion forwards `:finish`; error paths forward an error. A separately created receiver has its own lifecycle. The `use ExOpenAI.StreamingClient` macro supplies the GenServer setup and forwards casts to the receiver's `handle_data/2`, `handle_error/2`, and `handle_finish/1` callbacks.

See [Streaming](streaming.md) for complete receiver and callback examples. Partial chat deltas can omit content or contain `nil`, so callers need to handle both cases.

### 11. Reading Compiled Types and Converting Response Keys

Generation works with quoted Elixir AST, but runtime conversion reads type metadata from compiled modules. You can inspect that metadata directly:

```elixir
{:ok, compiled_types} = Code.Typespec.fetch_types(ExOpenAI.Components.CreateCompletionResponse)
{:type, {:t, compiled_type_ast, []}} =
  Enum.find(compiled_types, fn
    {:type, {:t, _, []}} -> true
    _ -> false
  end)

IO.inspect(elem(compiled_type_ast, 0))
```

```text
:type
```

This is Erlang's compiled typespec representation. Its shapes differ from the Elixir AST built by `quote`: the converter matches nodes such as `{:remote_type, ...}`, `{:type, ..., :union, ...}`, and `{:atom, ..., value}`. Treating it as the same tree that `Macro.to_string/1` accepts would mix two different representations.

For a referenced object, the converter uses the compiled field types to walk nested values. For a type alias, it expands the alias's `t()` first. A nullable enum such as `ServiceTier.t() | nil` therefore needs alias expansion before enum matching. Otherwise the union only reveals a remote reference and `nil`, hiding the literal enum members.

For schema unions, normalized discriminator metadata can identify the concrete component from a field such as `"type"`. The converter uses explicit mappings or generated literal field types where available, with field overlap as a fallback. Ambiguous shapes without a distinguishing tag can therefore require additional generator or converter support.

#### Where atoms come from

Struct fields and enum atoms are created from the bundled specification during code generation and compilation. The runtime converter uses those known fields to find values under either their atom key or their JSON string key.

Dynamic objects, such as metadata and JSON Schema properties, retain their original keys. Unknown enum strings remain strings. In a compiled union that also accepts arbitrary strings, strings remain strings even if they match one of the enum alternatives.

This keeps arbitrary response data from creating an unbounded set of atoms. An inline typed map also preserves absence: if an optional field is missing from the payload, conversion leaves it out. A component struct, by contrast, already has all its fields and keeps `nil` defaults for absent values.

## Contributing to the Code Generation

To add or extend functionality:

1. Refresh `lib/ex_openai/docs/docs.yaml` from upstream when the API specification changes. Keep SDK-owned corrections in `lib/ex_openai/docs/overlay.yaml` and review any overlay conflicts reported by generation.
2. For a new schema shape, inspect `DocsParser.Schema`, `SchemaResolver`, and `TypespecGenerator`. Follow the shape through parsing, resolution, and both input and response types.
3. For a new endpoint, check the generated function's arity, argument order, body, query, content type, and success schema. Changes to request construction belong in `PathModuleGenerator`; shared schema selection belongs in `SchemaResolver`.
4. For response or streaming changes, inspect the emitted schema and the compiled component type as well as `ResponseConverter` or `StreamingClient`. Test the event envelope and helper lifecycle where applicable.
5. For new per-request settings, update `ExOpenAI.request_option()` and the code that separates HTTP options from API parameters.
6. Add tests using real shapes from `docs.yaml`. Check transmitted URLs and bodies with a capturing client or local HTTP server, so the tests exercise what the generated call actually sends.

Regenerate and validate from the repository root:

```sh
mise run generate_openai
mise exec -- mix format
mise run check
mise run test
mise run lint
mise exec -- mix docs --warnings-as-errors
```

`mise run check` performs a clean compile, checks generated-source consistency, and runs Dialyzer. `mix generate_openai_sources --check` renders the expected sources without writing them and reports changed, missing, or stale generated files. Keep scratch compilation and negative Dialyzer probes outside the application's compilation paths.

For a smaller investigation, inspect the parsed schema, render its AST with `Macro.to_string/1`, then compare it with the generated `.ex` file. That lets you locate a discrepancy at the stage that introduces it. See [Parsing and types](parsingv2.md) for the schema representation and [Configuration](configuration.md) for runtime client overrides.
