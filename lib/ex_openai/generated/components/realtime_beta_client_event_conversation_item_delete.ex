defmodule ExOpenAI.Components.RealtimeBetaClientEventConversationItemDelete do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event when you want to remove any item from the conversation
  history. The server will respond with a `conversation.item.deleted` event,
  unless the item does not exist in the conversation history, in which case the
  server will respond with an error.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.

  * `:item_id` - **required** - `String.t()`
    The ID of the item to delete.

  * `:type` - **required** - `:"conversation.item.delete"`
    The event type, must be `conversation.item.delete`.
    Allowed values: `"conversation.item.delete"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          item_id: String.t(),
          type: :"conversation.item.delete"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) => :"conversation.item.delete" | String.t()
            }
  defstruct [:event_id, :item_id, :type]
end
