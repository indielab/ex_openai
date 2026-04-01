defmodule ExOpenAI.Components.RealtimeBetaServerEventConversationItemRetrieved do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a conversation item is retrieved with `conversation.item.retrieve`.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item` - **required** - `ExOpenAI.Components.RealtimeConversationItem.t()`

  * `:type` - **required** - `:"conversation.item.retrieved"`  
    The event type, must be `conversation.item.retrieved`.  
    Allowed values: `"conversation.item.retrieved"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item: ExOpenAI.Components.RealtimeConversationItem.t(),
          type: :"conversation.item.retrieved"
        }
  defstruct [:event_id, :item, :type]
end
