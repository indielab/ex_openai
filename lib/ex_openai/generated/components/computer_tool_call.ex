defmodule ExOpenAI.Components.ComputerToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  A tool call to a computer use tool. See the
  [computer use guide](/docs/guides/tools-computer-use) for more information.


  ## Fields

  * `:action` - **optional** - `ExOpenAI.Components.ComputerAction.t()`

  * `:actions` - **optional** - `ExOpenAI.Components.ComputerActionList.t()`

  * `:call_id` - **required** - `String.t()`  
    An identifier used when responding to the tool call with output.

  * `:id` - **required** - `String.t()`  
    The unique ID of the computer call.

  * `:pending_safety_checks` - **required** - `[ExOpenAI.Components.ComputerCallSafetyCheckParam.t()]`  
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
          action: ExOpenAI.Components.ComputerAction.t() | nil,
          actions: ExOpenAI.Components.ComputerActionList.t() | nil,
          call_id: String.t(),
          id: String.t(),
          pending_safety_checks: list(ExOpenAI.Components.ComputerCallSafetyCheckParam.t()),
          status: (:in_progress | :completed) | :incomplete,
          type: :computer_call
        }
  defstruct [:action, :actions, :call_id, :id, :pending_safety_checks, :status, :type]
end
