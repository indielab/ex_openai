defmodule ExOpenAI.Components.BetaResponseRefusalDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial refusal text.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the content part that the refusal text is added to.

  * `:delta` - **required** - `String.t()`
    The refusal text that is added.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the refusal text is added to.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the refusal text is added to.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.refusal.delta"`
    The type of the event. Always `response.refusal.delta`.
    Allowed values: `"response.refusal.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.refusal.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content_index) => integer(),
              required(:delta) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.refusal.delta" | String.t()
            }
  defstruct [:agent, :content_index, :delta, :item_id, :output_index, :sequence_number, :type]
end
