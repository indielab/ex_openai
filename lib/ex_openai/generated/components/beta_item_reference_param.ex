defmodule ExOpenAI.Components.BetaItemReferenceParam do
  use ExOpenAI.Jason

  @moduledoc """
  An internal identifier for an item to reference.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:id` - **required** - `String.t()`
    The ID of the item to reference.

  * `:type` - **optional** - `:item_reference | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          id: String.t(),
          type: (:item_reference | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:id) => String.t(),
              optional(:type) => (:item_reference | String.t()) | nil
            }
  defstruct [:agent, :id, :type]
end
