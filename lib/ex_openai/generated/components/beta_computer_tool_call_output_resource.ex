defmodule ExOpenAI.Components.BetaComputerToolCallOutputResource do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaComputerToolCallOutputResource.

  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t())`
    The safety checks reported by the API that have been acknowledged by the
  developer.

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t()`
    The ID of the computer tool call that produced the output.

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:id` - **required** - `String.t()`
    The unique ID of the computer call tool output.

  * `:output` - **required** - `ExOpenAI.Components.BetaComputerScreenshotImage.t()`

  * `:status` - **required** - `ExOpenAI.Components.BetaComputerCallOutputStatus.t()`
    The status of the message input. One of `in_progress`, `completed`, or
  `incomplete`. Populated when input items are returned via API.

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
          created_by: String.t() | nil,
          id: String.t(),
          output: ExOpenAI.Components.BetaComputerScreenshotImage.t(),
          status: ExOpenAI.Components.BetaComputerCallOutputStatus.t(),
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
              optional(:created_by) => String.t(),
              required(:id) => String.t(),
              required(:output) => ExOpenAI.Components.BetaComputerScreenshotImage.input(),
              required(:status) => ExOpenAI.Components.BetaComputerCallOutputStatus.input(),
              required(:type) => :computer_call_output | String.t()
            }
  defstruct [
    :acknowledged_safety_checks,
    :agent,
    :call_id,
    :created_by,
    :id,
    :output,
    :status,
    :type
  ]
end
