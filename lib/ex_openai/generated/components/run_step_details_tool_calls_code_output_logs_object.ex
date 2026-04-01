defmodule ExOpenAI.Components.RunStepDetailsToolCallsCodeOutputLogsObject do
  use ExOpenAI.Jason

  @moduledoc """
  Text output from the Code Interpreter tool call as part of a run step.

  ## Fields

  * `:logs` - **required** - `String.t()`  
    The text output from the Code Interpreter tool call.

  * `:type` - **required** - `:logs`  
    Always `logs`.  
    Allowed values: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, logs: String.t(), type: :logs}
  defstruct [:logs, :type]
end
