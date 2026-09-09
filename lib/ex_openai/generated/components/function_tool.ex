defmodule ExOpenAI.Components.FunctionTool do
  use ExOpenAI.Jason

  @moduledoc """
  Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil`

  * `:defer_loading` - **optional** - `boolean()`
    Whether this function is deferred and loaded via tool search.

  * `:description` - **optional** - `String.t() | nil`

  * `:name` - **required** - `String.t()`
    The name of the function to call.

  * `:output_schema` - **optional** - `map() | nil`

  * `:parameters` - **required** - `map() | nil`

  * `:strict` - **required** - `boolean() | nil`

  * `:type` - **required** - `:function`
    The type of the function tool. Always `function`.
    Allowed values: `"function"`
    Default: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers: (list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil) | nil,
          defer_loading: boolean() | nil,
          description: (String.t() | nil) | nil,
          name: String.t(),
          output_schema: (map() | nil) | nil,
          parameters: map() | nil,
          strict: boolean() | nil,
          type: :function
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.CallableToolAllowedCaller.input()) | nil,
              optional(:defer_loading) => boolean(),
              optional(:description) => String.t() | nil,
              required(:name) => String.t(),
              optional(:output_schema) => map() | nil,
              required(:parameters) => map() | nil,
              required(:strict) => boolean() | nil,
              required(:type) => :function | String.t()
            }
  defstruct [
    :allowed_callers,
    :defer_loading,
    :description,
    :name,
    :output_schema,
    :parameters,
    :strict,
    :type
  ]
end
