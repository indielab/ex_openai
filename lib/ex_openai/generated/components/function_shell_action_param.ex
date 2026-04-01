defmodule ExOpenAI.Components.FunctionShellActionParam do
  use ExOpenAI.Jason

  @moduledoc """
  Commands and limits describing how to run the shell tool call.

  ## Fields

  * `:commands` - **required** - `[String.t()]`  
    Ordered shell commands for the execution environment to run.

  * `:max_output_length` - **optional** - `integer() | any()`

  * `:timeout_ms` - **optional** - `integer() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          commands: list(String.t()),
          max_output_length: (integer() | any()) | nil,
          timeout_ms: (integer() | any()) | nil
        }
  defstruct [:commands, :max_output_length, :timeout_ms]
end
