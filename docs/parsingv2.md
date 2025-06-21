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
- References: currently returns `any()` (TODO: resolve refs)
