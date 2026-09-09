defmodule ExOpenAI.Components.UsageCodeInterpreterSessionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated code interpreter sessions usage details of the specific time bucket.

  ## Fields

  * `:num_sessions` - **required** - `integer()`
    The number of code interpreter sessions.

  * `:object` - **required** - `:"organization.usage.code_interpreter_sessions.result"`
    Allowed values: `"organization.usage.code_interpreter_sessions.result"`

  * `:project_id` - **optional** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          num_sessions: integer(),
          object: :"organization.usage.code_interpreter_sessions.result",
          project_id: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:num_sessions) => integer(),
              required(:object) =>
                :"organization.usage.code_interpreter_sessions.result" | String.t(),
              optional(:project_id) => String.t() | nil
            }
  defstruct [:num_sessions, :object, :project_id]
end
