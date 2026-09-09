defmodule ExOpenAI.Components.ResponseReasoningSummaryPartAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new reasoning summary part is added.

  ## Fields

  * `:item_id` - **required** - `String.t()`
    The ID of the item this summary part is associated with.

  * `:output_index` - **required** - `integer()`
    The index of the output item this summary part is associated with.

  * `:part` - **required** - `%{required(:text) => String.t(), required(:type) => :summary_text}`
    The summary part that was added.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:summary_index` - **required** - `integer()`
    The index of the summary part within the reasoning summary.

  * `:type` - **required** - `:"response.reasoning_summary_part.added"`
    The type of the event. Always `response.reasoning_summary_part.added`.
    Allowed values: `"response.reasoning_summary_part.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          part: %{required(:text) => String.t(), required(:type) => :summary_text},
          sequence_number: integer(),
          summary_index: integer(),
          type: :"response.reasoning_summary_part.added"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:part) => %{
                required(:text) => String.t(),
                required(:type) => :summary_text | String.t()
              },
              required(:sequence_number) => integer(),
              required(:summary_index) => integer(),
              required(:type) => :"response.reasoning_summary_part.added" | String.t()
            }
  defstruct [:item_id, :output_index, :part, :sequence_number, :summary_index, :type]
end
