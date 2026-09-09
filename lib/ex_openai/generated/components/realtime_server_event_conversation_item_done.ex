defmodule ExOpenAI.Components.RealtimeServerEventConversationItemDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a conversation item is finalized.

  The event will include the full content of the Item except for audio data, which can be retrieved separately with a `conversation.item.retrieve` event if needed.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item` - **required** - `ExOpenAI.Components.RealtimeConversationItem.t()`

  * `:previous_item_id` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:"conversation.item.done"`
    The event type, must be `conversation.item.done`.
    Allowed values: `"conversation.item.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item: ExOpenAI.Components.RealtimeConversationItem.t(),
          previous_item_id: (String.t() | nil) | nil,
          type: :"conversation.item.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:item) => ExOpenAI.Components.RealtimeConversationItem.input(),
              optional(:previous_item_id) => String.t() | nil,
              required(:type) => :"conversation.item.done" | String.t()
            }
  defstruct [:event_id, :item, :previous_item_id, :type]
end
