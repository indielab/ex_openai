defmodule ExOpenAI.Components.BetaComputerToolCallOutput do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a computer tool call.


  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t())`
    The safety checks reported by the API that have been acknowledged by the
  developer.

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t()`
    The ID of the computer tool call that produced the output.

  * `:id` - **optional** - `String.t()`
    The ID of the computer tool call output.

  * `:output` - **required** - `ExOpenAI.Components.BetaComputerScreenshotImage.t()`

  * `:status` - **optional** - `:in_progress | :completed | :incomplete`
    The status of the message input. One of `in_progress`, `completed`, or
  `incomplete`. Populated when input items are returned via API.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:type` - **required** - `:computer_call_output`
    The type of the computer tool call output. Always `computer_call_output`.
    Allowed values: `"computer_call_output"`
    Default: `"computer_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          acknowledged_safety_checks:
            list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t()) | nil,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          call_id: String.t(),
          id: String.t() | nil,
          output: ExOpenAI.Components.BetaComputerScreenshotImage.t(),
          status: ((:in_progress | :completed) | :incomplete) | nil,
          type: :computer_call_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:acknowledged_safety_checks) =>
                list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.input()),
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:call_id) => String.t(),
              optional(:id) => String.t(),
              required(:output) => ExOpenAI.Components.BetaComputerScreenshotImage.input(),
              optional(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:type) => :computer_call_output | String.t()
            }
  defstruct [:acknowledged_safety_checks, :agent, :call_id, :id, :output, :status, :type]
end
