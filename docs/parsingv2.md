# Parsing and types

`ExOpenAI.Codegen.DocsParser.get_documentation/1` parses an OpenAPI YAML string
into a `Documentation` struct. Its `components` map contains `Schema` structs;
its `paths` map contains `Path` structs and their operations.

```elixir
documentation = ExOpenAI.Codegen.SourceFileGenerator.load_documentation()
operation = documentation.paths["/responses"].operations["post"]
body_schema = ExOpenAI.Codegen.SchemaResolver.get_request_body_schema(
  operation.request_body,
  documentation.components
)
IO.inspect(Map.keys(body_schema.properties))
```

## Schemas

Properties and array items are schemas themselves. `Schema` records references,
primitive types, required fields, `allOf`, `anyOf`, `oneOf`, enums, nullability,
and discriminator metadata. `raw` retains the source object for constraints and
examples used in documentation.

`SchemaResolver` merges the properties and required fields of `allOf` object
schemas. Request bodies can use a component reference or an inline schema. The
resolver chooses the same content type as the generated HTTP call.

A required property and a required request body are separate concepts. Required
properties become positional arguments only when the body is also required.
Otherwise they remain available through keyword options.

## Typespecs

`TypespecGenerator.schema_to_typespec/2` emits response types:

| Schema | Elixir type |
| --- | --- |
| string | `String.t()` |
| integer | `integer()` |
| number | `number()` |
| boolean | `boolean()` |
| null | `nil` |
| string enum | Atom literal or union of atom literals |
| array | `list(item_type)` |
| object with properties | Map with required and optional keys |
| object with dynamic properties | `map()` |
| component reference | `ExOpenAI.Components.Name.t()` |
| `anyOf` or `oneOf` | Union of the member types |

`nullable: true` adds `nil`. An explicit `type: "null"` also contributes `nil`
when it appears inside a union.

`schema_to_input_typespec/2` emits input types. These use component `input()`
types, allow atom-keyed maps, accept strings for enum inputs, and represent file
uploads as `binary() | {String.t(), binary()}`.

Object components define a struct, its response `t()`, and an `input()` type.
Scalar, array, and union components define type aliases without a struct.

## Generated functions

Endpoints are grouped by the first URL path segment. Function names come from
`operationId`. Positional arguments are sorted alphabetically; the final argument
is a keyword list with a default of `[]`.

The generated function separates body, query, and HTTP options before calling
`ExOpenAI.Config.http_client().api_call/6`. `ExOpenAI.Client` is the default client.
See [configuration](configuration.md) for overrides.

Success responses use the documented 2xx schema. Streaming calls return
`{:ok, reference()}`; data reaches the callback or receiver separately.

## Dialyzer limits

Typespecs describe the API but do not perform runtime validation. Dialyzer checks
for definite inconsistencies and can miss invalid keyword values or nested union
members. An explicit component return contract provides a stronger check when
constructing a request schema in application code.

## Upstream corrections

SDK generation uses `SourceFileGenerator.load_documentation/0`, which supplies
`overlay.yaml` to `DocsParser.get_documentation/2`. The overlay is applied to the
YAML map before parsing; it does not rewrite `docs.yaml`. Direct calls to
`get_documentation/1` parse only the supplied document.

Streaming support and event envelopes are derived from the response schemas.
See the [codegen tutorial](codegen.md) for the overlay format, schema inference,
and upstream conflict checks.
