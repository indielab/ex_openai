defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseAudioDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the model-generated audio is done. Also emitted when a Response
  is interrupted, incomplete, or cancelled.


  ## Fields

  * `:content_index` - **required** - `integer()`  
    The index of the content part in the item's content array.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`  
    The ID of the response.

  * `:type` - **required** - `:"response.output_audio.done"`  
    The event type, must be `response.output_audio.done`.  
    Allowed values: `"response.output_audio.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.output_audio.done"
        }
  defstruct [:content_index, :event_id, :item_id, :output_index, :response_id, :type]
end
