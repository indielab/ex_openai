defmodule ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that the shell commands finished and returned an exit code.

  ## Fields

  * `:exit_code` - **required** - `integer()`  
    The exit code returned by the shell process.

  * `:type` - **required** - `:exit`  
    The outcome type. Always `exit`.  
    Allowed values: `"exit"`  
    Default: `"exit"`
  """
  @type t() :: %{__struct__: __MODULE__, exit_code: integer(), type: :exit}
  defstruct [:exit_code, :type]
end
