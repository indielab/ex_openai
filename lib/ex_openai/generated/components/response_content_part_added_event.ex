defmodule ExOpenAI.Components.ResponseContentPartAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new content part is added.

  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the content part that was added.

  * `:item_id` - **required** - `String.t()`  
    The ID of the output item that the content part was added to.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that the content part was added to.

  * `:part` - **required** - `ExOpenAI.Components.OutputContent.t()`  
    The content part that was added.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.content_part.added"`  
    The type of the event. Always `response.content_part.added`.  
    Allowed values: `"response.content_part.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          part: ExOpenAI.Components.OutputContent.t(),
          sequence_number: integer(),
          type: :"response.content_part.added"
        }
  defstruct [:content_index, :item_id, :output_index, :part, :sequence_number, :type]
end
