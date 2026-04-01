defmodule ExOpenAI.Components.ChatkitWorkflowTracing do
  use ExOpenAI.Jason

  @moduledoc """
  Controls diagnostic tracing during the session.

  ## Fields

  * `:enabled` - **required** - `boolean()`  
    Indicates whether tracing is enabled.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean()}
  defstruct [:enabled]
end
