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
- Paths are grouped by their operation tags (e.g., all operations tagged "Chat" go into `ExOpenAI.Chat`)
- If no tags are present, the module name is derived from the operation ID
- Multiple paths can contribute functions to the same module if they share tags

### Function generation
- Each operation becomes a function named after its `operationId`
- Operation IDs are converted from camelCase to snake_case:
  - `createChatCompletion` → `create_chat_completion`
  - `getAPIKey` → `get_api_key`
  - `updateXMLConfig` → `update_xml_config`

### Argument parsing
- Operations with only optional parameters: `def function_name(opts \\ [])`
- Operations with required request body fields:
  - Required fields become positional arguments (sorted alphabetically)
  - Optional fields go in the `opts` keyword list
  - Example: `def create_chat_completion(messages, model, opts \\ [])`
- The generator resolves schema references and handles `allOf` to merge required fields

### Example

From a path like:
```elixir
%Path{
  path: "/chat/completions",
  operations: %{
    "get" => %Operation{
      operation_id: "listChatCompletions", 
      tags: ["Chat"],
      parameters: [%{required: false, name: "limit"}, ...]
    },
    "post" => %Operation{
      operation_id: "createChatCompletion", 
      tags: ["Chat"],
      request_body: %{
        required: true,
        content: %{"application/json" => %{"schema" => %{"$ref" => "#/components/schemas/CreateChatCompletionRequest"}}}
      }
    }
  }
}
```

With schema:
```elixir
%{
  "CreateChatCompletionRequest" => %Schema{
    properties: %{"messages" => ..., "model" => ..., "temperature" => ...},
    required: ["messages", "model"]
  }
}
```

Generates:
```elixir
defmodule ExOpenAI.Chat do
  @moduledoc false
  
  def list_chat_completions(opts \\ []) do
    # TODO: Implement
    {opts, :ok}
  end
  
  def create_chat_completion(messages, model, opts \\ []) do
    # TODO: Implement
    {messages, model, opts, :ok}
  end
end
```
