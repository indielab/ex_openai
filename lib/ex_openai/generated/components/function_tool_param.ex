defmodule ExOpenAI.Components.FunctionToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FunctionToolParam.

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil`

  * `:defer_loading` - **optional** - `boolean()`
    Whether this function should be deferred and discovered via tool search.

  * `:description` - **optional** - `String.t() | nil`

  * `:name` - **required** - `String.t()`
    Constraints: minLength: 1, maxLength: 128, pattern: "^[a-zA-Z0-9_-]+$"

  * `:output_schema` - **optional** - `map() | nil`

  * `:parameters` - **optional** - `ExOpenAI.Components.EmptyModelParam.t() | nil`

  * `:strict` - **optional** - `boolean() | nil`

  * `:type` - **required** - `:function`
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
          parameters: (ExOpenAI.Components.EmptyModelParam.t() | nil) | nil,
          strict: (boolean() | nil) | nil,
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
              optional(:parameters) => ExOpenAI.Components.EmptyModelParam.input() | nil,
              optional(:strict) => boolean() | nil,
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
