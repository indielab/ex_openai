defmodule ExOpenAI.Components.BetaComputerToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  A tool call to a computer use tool. See the
  [computer use guide](https://platform.openai.com/docs/guides/tools-computer-use) for more information.


  ## Fields

  * `:action` - **optional** - `ExOpenAI.Components.BetaComputerAction.t()`

  * `:actions` - **optional** - `ExOpenAI.Components.BetaComputerActionList.t()`

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t()`
    An identifier used when responding to the tool call with output.

  * `:id` - **required** - `String.t()`
    The unique ID of the computer call.

  * `:pending_safety_checks` - **required** - `list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t())`
    The pending safety checks for the computer call.

  * `:status` - **required** - `:in_progress | :completed | :incomplete`
    The status of the item. One of `in_progress`, `completed`, or
  `incomplete`. Populated when items are returned via API.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:type` - **required** - `:computer_call`
    The type of the computer call. Always `computer_call`.
    Allowed values: `"computer_call"`
    Default: `"computer_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaComputerAction.t() | nil,
          actions: ExOpenAI.Components.BetaComputerActionList.t() | nil,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          call_id: String.t(),
          id: String.t(),
          pending_safety_checks: list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.t()),
          status: (:in_progress | :completed) | :incomplete,
          type: :computer_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:action) => ExOpenAI.Components.BetaComputerAction.input(),
              optional(:actions) => ExOpenAI.Components.BetaComputerActionList.input(),
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:call_id) => String.t(),
              required(:id) => String.t(),
              required(:pending_safety_checks) =>
                list(ExOpenAI.Components.BetaComputerCallSafetyCheckParam.input()),
              required(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:type) => :computer_call | String.t()
            }
  defstruct [:action, :actions, :agent, :call_id, :id, :pending_safety_checks, :status, :type]
end
