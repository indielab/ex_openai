defmodule ExOpenAI.Components.ResponseOutputItemAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new output item is added.

  ## Fields

  * `:item` - **required** - `ExOpenAI.Components.OutputItem.t()`  
    The output item that was added.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that was added.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.output_item.added"`  
    The type of the event. Always `response.output_item.added`.  
    Allowed values: `"response.output_item.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item: ExOpenAI.Components.OutputItem.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_item.added"
        }
  defstruct [:item, :output_index, :sequence_number, :type]
end
