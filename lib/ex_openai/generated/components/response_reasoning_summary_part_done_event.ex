defmodule ExOpenAI.Components.ResponseReasoningSummaryPartDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a reasoning summary part is completed.

  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The ID of the item this summary part is associated with.

  * `:output_index` - **required** - `integer()`  
    The index of the output item this summary part is associated with.

  * `:part` - **required** - `{:%{}, [], [{{:required, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:type]}, :summary_text}]}`  
    The completed summary part.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:summary_index` - **required** - `integer()`  
    The index of the summary part within the reasoning summary.

  * `:type` - **required** - `:"response.reasoning_summary_part.done"`  
    The type of the event. Always `response.reasoning_summary_part.done`.  
    Allowed values: `"response.reasoning_summary_part.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          part: %{required(:text) => String.t(), required(:type) => :summary_text},
          sequence_number: integer(),
          summary_index: integer(),
          type: :"response.reasoning_summary_part.done"
        }
  defstruct [:item_id, :output_index, :part, :sequence_number, :summary_index, :type]
end
