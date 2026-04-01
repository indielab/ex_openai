defmodule ExOpenAI.Components.RealtimeServerEventConversationItemAdded do
  use ExOpenAI.Jason

  @moduledoc """
  Sent by the server when an Item is added to the default Conversation. This can happen in several cases:
  - When the client sends a `conversation.item.create` event.
  - When the input audio buffer is committed. In this case the item will be a user message containing the audio from the buffer.
  - When the model is generating a Response. In this case the `conversation.item.added` event will be sent when the model starts generating a specific Item, and thus it will not yet have any content (and `status` will be `in_progress`).

  The event will include the full content of the Item (except when model is generating a Response) except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if necessary.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item` - **required** - `ExOpenAI.Components.RealtimeConversationItem.t()`

  * `:previous_item_id` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:"conversation.item.added"`  
    The event type, must be `conversation.item.added`.  
    Allowed values: `"conversation.item.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item: ExOpenAI.Components.RealtimeConversationItem.t(),
          previous_item_id: (String.t() | any()) | nil,
          type: :"conversation.item.added"
        }
  defstruct [:event_id, :item, :previous_item_id, :type]
end
