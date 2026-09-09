defmodule ExOpenAI.Components.TextResponseFormatJsonSchema do
  use ExOpenAI.Jason

  @moduledoc """
  JSON Schema response format. Used to generate structured JSON responses.
  Learn more about [Structured Outputs](https://platform.openai.com/docs/guides/structured-outputs).


  ## Fields

  * `:description` - **optional** - `String.t()`
    A description of what the response format is for, used by the model to
  determine how to respond in the format.

  * `:name` - **required** - `String.t()`
    The name of the response format. Must be a-z, A-Z, 0-9, or contain
  underscores and dashes, with a maximum length of 64.

  * `:schema` - **required** - `ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t()`

  * `:strict` - **optional** - `boolean() | nil`

  * `:type` - **required** - `:json_schema`
    The type of response format being defined. Always `json_schema`.
    Allowed values: `"json_schema"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t() | nil,
          name: String.t(),
          schema: ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t(),
          strict: (boolean() | nil) | nil,
          type: :json_schema
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:description) => String.t(),
              required(:name) => String.t(),
              required(:schema) => ExOpenAI.Components.ResponseFormatJsonSchemaSchema.input(),
              optional(:strict) => boolean() | nil,
              required(:type) => :json_schema | String.t()
            }
  defstruct [:description, :name, :schema, :strict, :type]
end
