defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsCodeOutputLogsObject do
  use ExOpenAI.Jason

  @moduledoc """
  Text output from the Code Interpreter tool call as part of a run step.

  ## Fields

  * `:index` - **required** - `integer()`
    The index of the output in the outputs array.

  * `:logs` - **optional** - `String.t()`
    The text output from the Code Interpreter tool call.

  * `:type` - **required** - `:logs`
    Always `logs`.
    Allowed values: `"logs"`
  """
  @type t() :: %{__struct__: __MODULE__, index: integer(), logs: String.t() | nil, type: :logs}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:index) => integer(),
              optional(:logs) => String.t(),
              required(:type) => :logs | String.t()
            }
  defstruct [:index, :logs, :type]
end
