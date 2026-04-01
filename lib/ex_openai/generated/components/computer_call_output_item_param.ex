defmodule ExOpenAI.Components.ComputerCallOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a computer tool call.

  ## Fields

  * `:acknowledged_safety_checks` - **optional** - `[ExOpenAI.Components.ComputerCallSafetyCheckParam.t()] | any()`

  * `:call_id` - **required** - `String.t()`  
    The ID of the computer tool call that produced the output.  
    Constraints: minLength: 1, maxLength: 64

  * `:id` - **optional** - `String.t() | any()`

  * `:output` - **required** - `ExOpenAI.Components.ComputerScreenshotImage.t()`

  * `:status` - **optional** - `ExOpenAI.Components.FunctionCallItemStatus.t() | any()`

  * `:type` - **required** - `:computer_call_output`  
    The type of the computer tool call output. Always `computer_call_output`.  
    Allowed values: `"computer_call_output"`  
    Default: `"computer_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          acknowledged_safety_checks:
            (list(ExOpenAI.Components.ComputerCallSafetyCheckParam.t()) | any()) | nil,
          call_id: String.t(),
          id: (String.t() | any()) | nil,
          output: ExOpenAI.Components.ComputerScreenshotImage.t(),
          status: (ExOpenAI.Components.FunctionCallItemStatus.t() | any()) | nil,
          type: :computer_call_output
        }
  defstruct [:acknowledged_safety_checks, :call_id, :id, :output, :status, :type]
end
