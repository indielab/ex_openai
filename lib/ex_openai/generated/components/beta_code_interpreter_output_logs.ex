defmodule ExOpenAI.Components.BetaCodeInterpreterOutputLogs do
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:logs) => String.t(), required(:type) => :logs | String.t()}
  defstruct [:logs, :type]
end
