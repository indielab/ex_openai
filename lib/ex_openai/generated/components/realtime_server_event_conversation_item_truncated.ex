defmodule ExOpenAI.Components.RealtimeServerEventConversationItemTruncated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an earlier assistant audio message item is truncated by the 
  client with a `conversation.item.truncate` event. This event is used to 
  synchronize the server's understanding of the audio with the client's playback.

  This action will truncate the audio and remove the server-side text transcript 
  to ensure there is no text in the context that hasn't been heard by the user.


  ## Fields

  * `:audio_end_ms` - **required** - `integer()`  
    The duration up to which the audio was truncated, in milliseconds.

  * `:content_index` - **required** - `integer()`  
    The index of the content part that was truncated.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the assistant message item that was truncated.

  * `:type` - **required** - `:"conversation.item.truncated"`  
    The event type, must be `conversation.item.truncated`.  
    Allowed values: `"conversation.item.truncated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_end_ms: integer(),
          content_index: integer(),
          event_id: String.t(),
          item_id: String.t(),
          type: :"conversation.item.truncated"
        }
  defstruct [:audio_end_ms, :content_index, :event_id, :item_id, :type]
end
