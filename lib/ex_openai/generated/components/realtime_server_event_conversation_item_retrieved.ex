defmodule ExOpenAI.Components.RealtimeServerEventConversationItemRetrieved do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a conversation item is retrieved with `conversation.item.retrieve`. This is provided as a way to fetch the server's representation of an item, for example to get access to the post-processed audio data after noise cancellation and VAD. It includes the full content of the Item, including audio data.


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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:item) => ExOpenAI.Components.RealtimeConversationItem.input(),
              required(:type) => :"conversation.item.retrieved" | String.t()
            }
  defstruct [:event_id, :item, :type]
end
