defmodule ExOpenAI.Components.RealtimeServerEventInputAudioBufferCommitted do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an input audio buffer is committed, either by the client or
  automatically in server VAD mode. The `item_id` property is the ID of the user
  message item that will be created, thus a `conversation.item.created` event
  will also be sent to the client.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the user message item that will be created.

  * `:previous_item_id` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:"input_audio_buffer.committed"`  
    The event type, must be `input_audio_buffer.committed`.  
    Allowed values: `"input_audio_buffer.committed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item_id: String.t(),
          previous_item_id: (String.t() | any()) | nil,
          type: :"input_audio_buffer.committed"
        }
  defstruct [:event_id, :item_id, :previous_item_id, :type]
end
