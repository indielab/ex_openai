defmodule ExOpenAI.Components.ResponseReasoningTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a reasoning text is completed.

  ## Fields

  * `:content_index` - **required** - `integer()`
    The index of the reasoning content part.

  * `:item_id` - **required** - `String.t()`
    The ID of the item this reasoning text is associated with.

  * `:output_index` - **required** - `integer()`
    The index of the output item this reasoning text is associated with.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:text` - **required** - `String.t()`
    The full text of the completed reasoning content.

  * `:type` - **required** - `:"response.reasoning_text.done"`
    The type of the event. Always `response.reasoning_text.done`.
    Allowed values: `"response.reasoning_text.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          text: String.t(),
          type: :"response.reasoning_text.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:text) => String.t(),
              required(:type) => :"response.reasoning_text.done" | String.t()
            }
  defstruct [:content_index, :item_id, :output_index, :sequence_number, :text, :type]
end
