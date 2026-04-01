defmodule ExOpenAI.Components.WorkflowParam do
  use ExOpenAI.Jason

  @moduledoc """
  Workflow reference and overrides applied to the chat session.

  ## Fields

  * `:id` - **required** - `String.t()`  
    Identifier for the workflow invoked by the session.

  * `:state_variables` - **optional** - `map()`  
    State variables forwarded to the workflow. Keys may be up to 64 characters, values must be primitive types, and the map defaults to an empty object.

  * `:tracing` - **optional** - `ExOpenAI.Components.WorkflowTracingParam.t()`  
    Optional tracing overrides for the workflow invocation. When omitted, tracing is enabled by default.

  * `:version` - **optional** - `String.t()`  
    Specific workflow version to run. Defaults to the latest deployed version.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          state_variables: map() | nil,
          tracing: ExOpenAI.Components.WorkflowTracingParam.t() | nil,
          version: String.t() | nil
        }
  defstruct [:id, :state_variables, :tracing, :version]
end
