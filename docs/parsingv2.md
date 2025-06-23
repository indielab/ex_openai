# How parsing works

## Step 1: Turn yaml into Elixir structs

This happens in `docs_parser.ex`

It turns

```yml
      components:
        schemas:
          AddUploadPartRequest:
            type: object
            additionalProperties: false
            properties:
              data:
                type: string
                format: binary
      paths:
        /assistants:
          get:
            operationId: listAssistants
            tags:
              - Assistants
            summary: Returns a list of assistants.
            parameters:
              - name: limit
                in: query
                required: false
                schema:
                  type: integer
                  default: 20
```

Into Elixir structs `ExOpenAI.Codegen.DocsParser.Schema` and `ExOpenAI.Codegen.DocsParser.Path`. No transformation has happened at this stage, the Elixir structs represent the schema 1:1, just as properly typed structs

### Why properties use the same Schema struct

In OpenAPI, properties are full JSON Schemas themselves - there's no distinction between a "top-level schema" and a "property schema". Both can have:
- Nested properties
- Type combinators (anyOf, oneOf, allOf)
- All schema attributes (type, format, required, etc.)

This is why `Schema.properties` is typed as `%{String.t() => Schema.t()}` - each property is itself a complete schema that can be arbitrarily complex.

## Step 2: Convert Schema structs to Elixir typespecs

The `TypespecGenerator` module takes a `Schema.t()` and converts it into an Elixir typespec AST.

## Step 3: Generate complete Elixir modules

The `ComponentModuleGenerator` combines the parsed schemas and typespecs to generate complete Elixir modules.

For example, a schema like:
```elixir
%Schema{
  type: "object",
  properties: %{
    "name" => %Schema{type: "string"},
    "age" => %Schema{type: "integer"}
  },
  required: ["name"]
}
```

Becomes a typespec:
```elixir
%{
  required(:name) => String.t(),
  optional(:age) => integer()
}
```

### Supported patterns

- Basic types: string, integer, number, boolean
- Nullable fields: adds `| nil` to the type
- Enums: converted to atom unions (e.g., `:active | :inactive`)
- Arrays: converted to `list(T)`
- Objects: converted to maps with required/optional keys
- Type combinators for schemas with `type: nil`:
  - `oneOf`: generates union types (e.g., `String.t() | list(any())`)
  - `anyOf`: same as oneOf, generates union types
  - `allOf`: currently returns `any()` (TODO: intersection types)
  - `enum`: generates atom union types
- References: resolves `#/components/schemas/ComponentName` to `ExOpenAI.Components.ComponentName.t()`
  - Other reference patterns still return `any()`

## Step 3: Generate complete Elixir modules for Components

The `ComponentModuleGenerator` combines the parsed schemas and typespecs to generate complete Elixir modules.

For object schemas, it generates:
- A `defstruct` with all property fields
- A `@type t()` specification with proper types for each field
- Optional fields automatically include `| nil` in their type
- `@moduledoc` from the schema description

For non-object schemas (enums, unions, etc.), it generates:
- A type alias `@type t()` with the appropriate type
- No struct definition

Example generated module:
```elixir
defmodule ExOpenAI.Components.ChatCompletionRequestUserMessage do
  @moduledoc "Messages sent by an end user..."
  
  @type t() :: %{
    __struct__: __MODULE__,
    content: String.t() | list(ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart.t()),
    name: String.t() | nil,
    role: :user
  }
  
  defstruct [:content, :name, :role]
end
```

## Step 4: Generate API modules from Paths

The `PathModuleGenerator` takes parsed Path structs and generates API client modules with proper function signatures.

### Module naming and grouping
- Paths are grouped by their first path segment (e.g., `/chat/completions` → `ExOpenAI.Chat`)
- This avoids issues with hyphenated tags like "admin-api-keys-delete"
- Multiple paths with the same prefix contribute functions to the same module

### Function generation
- Each operation becomes a function named after its `operationId`
- Operation IDs are converted from camelCase to snake_case:
  - `createChatCompletion` → `create_chat_completion`
  - `getAPIKey` → `get_api_key`
  - `admin-api-keys-delete` → `admin_api_keys_delete`

### Argument parsing
- Path parameters (e.g., `{model_id}`) become required positional arguments
- Required request body fields become positional arguments (sorted alphabetically)
- All functions have `opts \\ []` as the last parameter for optional fields and query parameters
- Examples:
  - `def list_assistants(opts \\ [])`
  - `def delete_assistant(assistant_id, opts \\ [])`
  - `def create_chat_completion(messages, model, opts \\ [])`

### Function body generation
The `FunctionBodyGenerator` creates the actual HTTP call implementation:
- Path parameters are replaced in the URL using `String.replace`
- Query parameters are extracted from `opts` and encoded as a query string
- Body parameters are collected into a keyword list for POST/PUT/PATCH requests
- The appropriate HTTP method is called via `ExOpenAI.Config.http_client().api_call/6`

### Example

From a path like:
```elixir
%Path{
  path: "/assistants/{assistant_id}",
  operations: %{
    "delete" => %Operation{
      operation_id: "deleteAssistant",
      method: "delete",
      parameters: [
        %Parameter{name: "assistant_id", in: "path", required: true}
      ]
    }
  }
}
```

Generates:
```elixir
defmodule ExOpenAI.Assistants do
  @moduledoc false
  
  def delete_assistant(assistant_id, opts \\ []) do
    url = "/assistants/{assistant_id}"
    url = String.replace(url, "{assistant_id}", to_string(assistant_id))
    
    query_params = Keyword.take(opts, [])
    query_string = if length(query_params) > 0 do
      "?" <> URI.encode_query(query_params)
    else
      ""
    end
    
    url = url <> query_string
    body_params = []
    
    convert_response = fn response -> response end
    
    ExOpenAI.Config.http_client().api_call(
      :delete,
      url,
      body_params,
      :"application/json",
      opts,
      convert_response
    )
  end
end
```
