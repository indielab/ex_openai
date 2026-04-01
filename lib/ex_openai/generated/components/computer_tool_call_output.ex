defmodule ExOpenAI.Components.ComputerToolCallOutput do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a computer tool call.


  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `[ExOpenAI.Components.ComputerCallSafetyCheckParam.t()]`  
    The safety checks reported by the API that have been acknowledged by the
  developer.

  * `:call_id` - **required** - `String.t()`  
    The ID of the computer tool call that produced the output.

  * `:id` - **optional** - `String.t()`  
    The ID of the computer tool call output.

  * `:output` - **required** - `ExOpenAI.Components.ComputerScreenshotImage.t()`

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
            list(ExOpenAI.Components.ComputerCallSafetyCheckParam.t()) | nil,
          call_id: String.t(),
          id: String.t() | nil,
          output: ExOpenAI.Components.ComputerScreenshotImage.t(),
          status: ((:in_progress | :completed) | :incomplete) | nil,
          type: :computer_call_output
        }
  defstruct [:acknowledged_safety_checks, :call_id, :id, :output, :status, :type]
end
