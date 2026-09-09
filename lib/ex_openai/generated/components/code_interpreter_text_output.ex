defmodule ExOpenAI.Components.CodeInterpreterTextOutput do
  use ExOpenAI.Jason

  @moduledoc """
  The output of a code interpreter tool call that is text.


  ## Fields

  * `:logs` - **required** - `String.t()`
    The logs of the code interpreter tool call.

  * `:type` - **required** - `:logs`
    The type of the code interpreter text output. Always `logs`.
    Allowed values: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, logs: String.t(), type: :logs}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:logs) => String.t(), required(:type) => :logs | String.t()}
  defstruct [:logs, :type]
end
