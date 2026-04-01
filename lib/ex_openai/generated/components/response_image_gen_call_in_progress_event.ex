defmodule ExOpenAI.Components.ResponseImageGenCallInProgressEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an image generation tool call is in progress.


  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The unique identifier of the image generation item being processed.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of the image generation item being processed.

  * `:type` - **required** - `:"response.image_generation_call.in_progress"`  
    The type of the event. Always 'response.image_generation_call.in_progress'.  
    Allowed values: `"response.image_generation_call.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.image_generation_call.in_progress"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
