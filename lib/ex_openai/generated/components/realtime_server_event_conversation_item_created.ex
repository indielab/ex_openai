defmodule ExOpenAI.Components.RealtimeServerEventConversationItemCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a conversation item is created. There are several scenarios that produce this event:
    - The server is generating a Response, which if successful will produce
      either one or two Items, which will be of type `message`
      (role `assistant`) or type `function_call`.
    - The input audio buffer has been committed, either by the client or the
      server (in `server_vad` mode). The server will take the content of the
      input audio buffer and add it to a new user message Item.
    - The client has sent a `conversation.item.create` event to add a new Item
      to the Conversation.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item` - **required** - `ExOpenAI.Components.RealtimeConversationItem.t()`

  * `:previous_item_id` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:"conversation.item.created"`  
    The event type, must be `conversation.item.created`.  
    Allowed values: `"conversation.item.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item: ExOpenAI.Components.RealtimeConversationItem.t(),
          previous_item_id: (String.t() | any()) | nil,
          type: :"conversation.item.created"
        }
  defstruct [:event_id, :item, :previous_item_id, :type]
end
