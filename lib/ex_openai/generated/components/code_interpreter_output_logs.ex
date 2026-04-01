defmodule ExOpenAI.Components.CodeInterpreterOutputLogs do
  use ExOpenAI.Jason

  @moduledoc """
  The logs output from the code interpreter.

  ## Fields

  * `:logs` - **required** - `String.t()`  
    The logs output from the code interpreter.

  * `:type` - **required** - `:logs`  
    The type of the output. Always `logs`.  
    Allowed values: `"logs"`  
    Default: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, logs: String.t(), type: :logs}
  defstruct [:logs, :type]
end
