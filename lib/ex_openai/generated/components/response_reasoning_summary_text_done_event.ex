defmodule ExOpenAI.Components.ResponseReasoningSummaryTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a reasoning summary text is completed.

  ## Fields

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
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          summary_index: integer(),
          text: String.t(),
          type: :"response.reasoning_summary_text.done"
        }
  defstruct [:item_id, :output_index, :sequence_number, :summary_index, :text, :type]
end
