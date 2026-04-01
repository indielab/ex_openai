defmodule ExOpenAI.Components.FunctionShellAction do
  use ExOpenAI.Jason

  @moduledoc """
  Execute a shell command.

  ## Fields

  * `:commands` - **required** - `[String.t()]`

  * `:max_output_length` - **required** - `integer() | any()`

  * `:timeout_ms` - **required** - `integer() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          commands: list(String.t()),
          max_output_length: integer() | any(),
          timeout_ms: integer() | any()
        }
  defstruct [:commands, :max_output_length, :timeout_ms]
end
