defmodule ExOpenAI.Components.BetaFunctionShellCallOutputContentParam do
  use ExOpenAI.Jason

  @moduledoc """
  Captured stdout and stderr for a portion of a shell tool call output.

  ## Fields

  * `:outcome` - **required** - `ExOpenAI.Components.BetaFunctionShellCallOutputOutcomeParam.t()`
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
          outcome: ExOpenAI.Components.BetaFunctionShellCallOutputOutcomeParam.t(),
          stderr: String.t(),
          stdout: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:outcome) =>
                ExOpenAI.Components.BetaFunctionShellCallOutputOutcomeParam.input(),
              required(:stderr) => String.t(),
              required(:stdout) => String.t()
            }
  defstruct [:outcome, :stderr, :stdout]
end
