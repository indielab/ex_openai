defmodule ExOpenAI.Components.FunctionShellCallOutputContentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Captured stdout and stderr for a portion of a shell tool call output.

  ## Fields

  * `:outcome` - **required** - `ExOpenAI.Components.FunctionShellCallOutputOutcomeParam.t()`  
    The exit or timeout outcome associated with this shell call.

  * `:stderr` - **required** - `String.t()`  
    Captured stderr output for the shell call.  
    Constraints: maxLength: 10485760

  * `:stdout` - **required** - `String.t()`  
    Captured stdout output for the shell call.  
    Constraints: maxLength: 10485760
  """
  @type t() :: %{
          __struct__: __MODULE__,
          outcome: ExOpenAI.Components.FunctionShellCallOutputOutcomeParam.t(),
          stderr: String.t(),
          stdout: String.t()
        }
  defstruct [:outcome, :stderr, :stdout]
end
