defmodule ExOpenAI.Components.BetaFunctionShellCallOutputContent do
  use ExOpenAI.Jason

  @moduledoc """
  The content of a shell tool call output that was emitted.

  ## Fields

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:outcome` - **required** - `ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcome.t() | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcome.t()`
    Represents either an exit outcome (with an exit code) or a timeout outcome for a shell call output chunk.

  * `:stderr` - **required** - `String.t()`
    The standard error output that was captured.

  * `:stdout` - **required** - `String.t()`
    The standard output that was captured.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_by: String.t() | nil,
          outcome:
            ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcome.t()
            | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcome.t(),
          stderr: String.t(),
          stdout: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:created_by) => String.t(),
              required(:outcome) =>
                ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcome.input()
                | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcome.input(),
              required(:stderr) => String.t(),
              required(:stdout) => String.t()
            }
  defstruct [:created_by, :outcome, :stderr, :stdout]
end
