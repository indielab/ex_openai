defmodule ExOpenAI.Components.TextResponseFormatJsonSchema do
  use ExOpenAI.Jason

  @moduledoc """
  JSON Schema response format. Used to generate structured JSON responses.
  Learn more about [Structured Outputs](/docs/guides/structured-outputs).


  ## Fields

  * `:description` - **optional** - `String.t()`  
    A description of what the response format is for, used by the model to
  determine how to respond in the format.

  * `:name` - **required** - `String.t()`  
    The name of the response format. Must be a-z, A-Z, 0-9, or contain
  underscores and dashes, with a maximum length of 64.

  * `:schema` - **required** - `ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t()`

  * `:strict` - **optional** - `boolean() | any()`

  * `:type` - **required** - `:json_schema`  
    The type of response format being defined. Always `json_schema`.  
    Allowed values: `"json_schema"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t() | nil,
          name: String.t(),
          schema: ExOpenAI.Components.ResponseFormatJsonSchemaSchema.t(),
          strict: (boolean() | any()) | nil,
          type: :json_schema
        }
  defstruct [:description, :name, :schema, :strict, :type]
end
