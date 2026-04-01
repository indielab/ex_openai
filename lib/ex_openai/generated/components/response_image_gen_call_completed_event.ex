defmodule ExOpenAI.Components.ResponseImageGenCallCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an image generation tool call has completed and the final image is available.


  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The unique identifier of the image generation item being processed.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.image_generation_call.completed"`  
    The type of the event. Always 'response.image_generation_call.completed'.  
    Allowed values: `"response.image_generation_call.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.image_generation_call.completed"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
