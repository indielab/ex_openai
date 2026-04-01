defmodule ExOpenAI.Components.HistoryParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls how much historical context is retained for the session.

  ## Fields

  * `:enabled` - **optional** - `boolean()`  
    Enables chat users to access previous ChatKit threads. Defaults to true.

  * `:recent_threads` - **optional** - `integer()`  
    Number of recent ChatKit threads users have access to. Defaults to unlimited when unset.  
    Constraints: minimum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          enabled: boolean() | nil,
          recent_threads: integer() | nil
        }
  defstruct [:enabled, :recent_threads]
end
