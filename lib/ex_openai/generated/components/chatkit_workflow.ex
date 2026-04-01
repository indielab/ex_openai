defmodule ExOpenAI.Components.ChatkitWorkflow do
  use ExOpenAI.Jason

  @moduledoc """
  Workflow metadata and state returned for the session.

  ## Fields

  * `:id` - **required** - `String.t()`  
    Identifier of the workflow backing the session.

  * `:state_variables` - **required** - `map() | any()`

  * `:tracing` - **required** - `ExOpenAI.Components.ChatkitWorkflowTracing.t()`  
    Tracing settings applied to the workflow.

  * `:version` - **required** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          state_variables: map() | any(),
          tracing: ExOpenAI.Components.ChatkitWorkflowTracing.t(),
          version: String.t() | any()
        }
  defstruct [:id, :state_variables, :tracing, :version]
end
