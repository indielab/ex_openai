defmodule ExOpenAI.Components.BetaCodeInterpreterTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that runs Python code to help generate a response to a prompt.


  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil`

  * `:container` - **required** - `String.t() | ExOpenAI.Components.BetaAutoCodeInterpreterToolParam.t()`
    The code interpreter container. Can be a container ID or an object that
  specifies uploaded file IDs to make available to your code, along with an
  optional `memory_limit` setting.

  * `:type` - **required** - `:code_interpreter`
    The type of the code interpreter tool. Always `code_interpreter`.
    Allowed values: `"code_interpreter"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers:
            (list(ExOpenAI.Components.BetaCallableToolAllowedCaller.t()) | nil) | nil,
          container: String.t() | ExOpenAI.Components.BetaAutoCodeInterpreterToolParam.t(),
          type: :code_interpreter
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.BetaCallableToolAllowedCaller.input()) | nil,
              required(:container) =>
                String.t() | ExOpenAI.Components.BetaAutoCodeInterpreterToolParam.input(),
              required(:type) => :code_interpreter | String.t()
            }
  defstruct [:allowed_callers, :container, :type]
end
