defmodule ExOpenAI.Components.BetaResponseRefusalDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when refusal text is finalized.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the content part that the refusal text is finalized.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the refusal text is finalized.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the refusal text is finalized.

  * `:refusal` - **required** - `String.t()`
    The refusal text that is finalized.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.refusal.done"`
    The type of the event. Always `response.refusal.done`.
    Allowed values: `"response.refusal.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          refusal: String.t(),
          sequence_number: integer(),
          type: :"response.refusal.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:refusal) => String.t(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.refusal.done" | String.t()
            }
  defstruct [:agent, :content_index, :item_id, :output_index, :refusal, :sequence_number, :type]
end
