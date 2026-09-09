defmodule ExOpenAI.Components.ChatkitWorkflow do
  use ExOpenAI.Jason

  @moduledoc """
  Workflow metadata and state returned for the session.

  ## Fields

  * `:id` - **required** - `String.t()`
    Identifier of the workflow backing the session.

  * `:state_variables` - **required** - `map() | nil`

  * `:tracing` - **required** - `ExOpenAI.Components.ChatkitWorkflowTracing.t()`
    Tracing settings applied to the workflow.

  * `:version` - **required** - `String.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t(),
          state_variables: map() | nil,
          tracing: ExOpenAI.Components.ChatkitWorkflowTracing.t(),
          version: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:id) => String.t(),
              required(:state_variables) => map() | nil,
              required(:tracing) => ExOpenAI.Components.ChatkitWorkflowTracing.input(),
              required(:version) => String.t() | nil
            }
  defstruct [:id, :state_variables, :tracing, :version]
end
