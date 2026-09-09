defmodule ExOpenAI.Components.BetaComputerCallOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a computer tool call.

  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t()) | nil`

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:call_id` - **required** - `String.t()`
    The ID of the computer tool call that produced the output.
    Constraints: minLength: 1, maxLength: 64

  * `:id` - **optional** - `String.t() | nil`

  * `:output` - **required** - `ExOpenAI.Components.BetaComputerScreenshotImage.t()`

  * `:status` - **optional** - `ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil`

  * `:type` - **required** - `:computer_call_output`
    The type of the computer tool call output. Always `computer_call_output`.
    Allowed values: `"computer_call_output"`
    Default: `"computer_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          acknowledged_safety_checks:
            (list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t()) | nil) | nil,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          call_id: String.t(),
          id: (String.t() | nil) | nil,
          output: ExOpenAI.Components.BetaComputerScreenshotImage.t(),
          status: (ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil) | nil,
          type: :computer_call_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:acknowledged_safety_checks) =>
                list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.input()) | nil,
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:call_id) => String.t(),
              optional(:id) => String.t() | nil,
              required(:output) => ExOpenAI.Components.BetaComputerScreenshotImage.input(),
              optional(:status) => ExOpenAI.Components.BetaFunctionCallItemStatus.input() | nil,
              required(:type) => :computer_call_output | String.t()
            }
  defstruct [:acknowledged_safety_checks, :agent, :call_id, :id, :output, :status, :type]
end
