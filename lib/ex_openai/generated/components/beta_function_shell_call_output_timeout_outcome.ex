defmodule ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcome do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that the shell call exceeded its configured time limit.

  ## Fields

  * `:type` - **required** - `:timeout`
    The outcome type. Always `timeout`.
    Allowed values: `"timeout"`
    Default: `"timeout"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :timeout}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :timeout | String.t()}
  defstruct [:type]
end
