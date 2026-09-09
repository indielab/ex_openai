defmodule ExOpenAI.Components.BetaResponseReasoningSummaryTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a reasoning summary text is completed.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item this summary text is associated with.

  * `:output_index` - **required** - `integer()`
    The index of the output item this summary text is associated with.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:summary_index` - **required** - `integer()`
    The index of the summary part within the reasoning summary.

  * `:text` - **required** - `String.t()`
    The full text of the completed reasoning summary.

  * `:type` - **required** - `:"response.reasoning_summary_text.done"`
    The type of the event. Always `response.reasoning_summary_text.done`.
    Allowed values: `"response.reasoning_summary_text.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          summary_index: integer(),
          text: String.t(),
          type: :"response.reasoning_summary_text.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:summary_index) => integer(),
              required(:text) => String.t(),
              required(:type) => :"response.reasoning_summary_text.done" | String.t()
            }
  defstruct [:agent, :item_id, :output_index, :sequence_number, :summary_index, :text, :type]
end
