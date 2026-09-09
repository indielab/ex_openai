defmodule ExOpenAI.Components.RealtimeClientEventConversationItemRetrieve do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event when you want to retrieve the server's representation of a specific item in the conversation history. This is useful, for example, to inspect user audio after noise cancellation and VAD.
  The server will respond with a `conversation.item.retrieved` event,
  unless the item does not exist in the conversation history, in which case the
  server will respond with an error.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:item_id` - **required** - `String.t()`
    The ID of the item to retrieve.

  * `:type` - **required** - `:"conversation.item.retrieve"`
    The event type, must be `conversation.item.retrieve`.
    Allowed values: `"conversation.item.retrieve"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          item_id: String.t(),
          type: :"conversation.item.retrieve"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) => :"conversation.item.retrieve" | String.t()
            }
  defstruct [:event_id, :item_id, :type]
end
