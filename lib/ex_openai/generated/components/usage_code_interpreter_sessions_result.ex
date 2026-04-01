defmodule ExOpenAI.Components.UsageCodeInterpreterSessionsResult do
  use ExOpenAI.Jason

  @moduledoc """
  The aggregated code interpreter sessions usage details of the specific time bucket.

  ## Fields

  * `:num_sessions` - **optional** - `integer()`  
    The number of code interpreter sessions.

  * `:object` - **required** - `:"organization.usage.code_interpreter_sessions.result"`  
    Allowed values: `"organization.usage.code_interpreter_sessions.result"`

  * `:project_id` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          num_sessions: integer() | nil,
          object: :"organization.usage.code_interpreter_sessions.result",
          project_id: (String.t() | any()) | nil
        }
  defstruct [:num_sessions, :object, :project_id]
end
