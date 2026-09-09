defmodule ExOpenAI.Components.Beta_AgentTagParam do
  use ExOpenAI.Jason

  @moduledoc """
  The agent that produced this item.

  ## Fields

  * `:agent_name` - **required** - `String.t()`
    The canonical name of the agent that produced this item.
  """
  @type t() :: %{__struct__: __MODULE__, agent_name: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:agent_name) => String.t()}
  defstruct [:agent_name]
end
