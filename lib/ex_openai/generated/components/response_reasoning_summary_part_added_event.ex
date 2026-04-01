defmodule ExOpenAI.Components.ResponseReasoningSummaryPartAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new reasoning summary part is added.

  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The ID of the item this summary part is associated with.

  * `:output_index` - **required** - `integer()`  
    The index of the output item this summary part is associated with.

  * `:part` - **required** - `{:%{}, [], [{{:required, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:type]}, :summary_text}]}`  
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
  defstruct [:item_id, :output_index, :part, :sequence_number, :summary_index, :type]
end
