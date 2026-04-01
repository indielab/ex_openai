defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject do
  use ExOpenAI.Jason

  @moduledoc """
  Text output from the Code Interpreter tool call as part of a run step.

  ## Fields

  * `:index` - **required** - `integer()`  
    The index of the output in the outputs array.

  * `:logs` - **optional** - `String.t()`  
    The text output from the Code Interpreter tool call.

  * `:type` - **required** - `:logs`  
    Always `logs`.  
    Allowed values: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, index: integer(), logs: String.t() | nil, type: :logs}
  defstruct [:index, :logs, :type]
end
