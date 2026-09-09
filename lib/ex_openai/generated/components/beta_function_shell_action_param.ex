defmodule ExOpenAI.Components.BetaFunctionShellActionParam do
  use ExOpenAI.Jason

  @moduledoc """
  Commands and limits describing how to run the shell tool call.

  ## Fields

  * `:commands` - **required** - `list(String.t())`
    Ordered shell commands for the execution environment to run.

  * `:max_output_length` - **optional** - `integer() | nil`

  * `:timeout_ms` - **optional** - `integer() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          commands: list(String.t()),
          max_output_length: (integer() | nil) | nil,
          timeout_ms: (integer() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:commands) => list(String.t()),
              optional(:max_output_length) => integer() | nil,
              optional(:timeout_ms) => integer() | nil
            }
  defstruct [:commands, :max_output_length, :timeout_ms]
end
