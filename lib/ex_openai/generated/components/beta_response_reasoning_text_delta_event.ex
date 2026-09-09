defmodule ExOpenAI.Components.BetaResponseReasoningTextDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a delta is added to a reasoning text.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the reasoning content part this delta is associated with.

  * `:delta` - **required** - `String.t()`
    The text delta that was added to the reasoning content.

  * `:item_id` - **required** - `String.t()`
    The ID of the item this reasoning text delta is associated with.

  * `:output_index` - **required** - `integer()`
    The index of the output item this reasoning text delta is associated with.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.reasoning_text.delta"`
    The type of the event. Always `response.reasoning_text.delta`.
    Allowed values: `"response.reasoning_text.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.reasoning_text.delta"
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
              required(:type) => :"response.reasoning_text.delta" | String.t()
            }
  defstruct [:agent, :content_index, :delta, :item_id, :output_index, :sequence_number, :type]
end
