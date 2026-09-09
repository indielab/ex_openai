defmodule ExOpenAI.Components.ResponseFormatJsonSchema do
  use ExOpenAI.Jason

  @moduledoc """
  JSON Schema response format. Used to generate structured JSON responses.
  Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).


  ## Fields

  * `:json_schema` - **required** - `%{ optional(:description) => String.t(), required(:name) => String.t(), optional(:schema) => ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t(), optional(:strict) => boolean() | nil }`
    Structured Outputs configuration options, including a JSON Schema.

  * `:type` - **required** - `:json_schema`
    The type of response format being defined. Always `json_schema`.
    Allowed values: `"json_schema"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          json_schema: %{
            optional(:description) => String.t(),
            required(:name) => String.t(),
            optional(:schema) => ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t(),
            optional(:strict) => boolean() | nil
          },
          type: :json_schema
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:json_schema) => %{
                optional(:description) => String.t(),
                required(:name) => String.t(),
                optional(:schema) => ExOpenAI.Components.ResponseFormatJsonSchemaSchema.input(),
                optional(:strict) => boolean() | nil
              },
              required(:type) => :json_schema | String.t()
            }
  defstruct [:json_schema, :type]
end
