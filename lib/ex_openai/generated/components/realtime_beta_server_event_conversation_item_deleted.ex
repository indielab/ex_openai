defmodule ExOpenAI.Components.RealtimeBetaServerEventConversationItemDeleted do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an item in the conversation is deleted by the client with a 
  `conversation.item.delete` event. This event is used to synchronize the 
  server's understanding of the conversation history with the client's view.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the item that was deleted.

  * `:type` - **required** - `:"conversation.item.deleted"`  
    The event type, must be `conversation.item.deleted`.  
    Allowed values: `"conversation.item.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item_id: String.t(),
          type: :"conversation.item.deleted"
        }
  defstruct [:event_id, :item_id, :type]
end
