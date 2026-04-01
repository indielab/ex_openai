defmodule ExOpenAI.Components.ResponseFormatJsonSchema do
  use ExOpenAI.Jason

  @moduledoc """
  JSON Schema response format. Used to generate structured JSON responses.
  Learn more about [Structured Outputs](/docs/guides/structured-outputs).


  ## Fields

  * `:json_schema` - **required** - `{:%{}, [], [{{:optional, [], [:description]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:schema]}, {{:., [], [ExOpenAI.Components.ResponseFormatJsonSchemaSchema, :t]}, [], []}}, {{:optional, [], [:strict]}, {:|, [], [{:boolean, [], []}, {:any, [], []}]}}]}`  
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
            optional(:strict) => boolean() | any()
          },
          type: :json_schema
        }
  defstruct [:json_schema, :type]
end
