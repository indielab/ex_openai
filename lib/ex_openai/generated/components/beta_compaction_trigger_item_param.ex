defmodule ExOpenAI.Components.BetaCompactionTriggerItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Compacts the current context. Must be the final input item.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:type` - **required** - `:compaction_trigger`
    The type of the item. Always `compaction_trigger`.
    Allowed values: `"compaction_trigger"`
    Default: `"compaction_trigger"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          type: :compaction_trigger
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:type) => :compaction_trigger | String.t()
            }
  defstruct [:agent, :type]
end
