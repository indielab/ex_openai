defmodule ExOpenAI.Components.RealtimeClientEventConversationItemTruncate do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to truncate a previous assistant message’s audio. The server
  will produce audio faster than realtime, so this event is useful when the user
  interrupts to truncate audio that has already been sent to the client but not
  yet played. This will synchronize the server's understanding of the audio with
  the client's playback.

  Truncating audio will delete the server-side text transcript to ensure there
  is not text in the context that hasn't been heard by the user.

  If successful, the server will respond with a `conversation.item.truncated`
  event.


  ## Fields

  * `:audio_end_ms` - **required** - `integer()`
    Inclusive duration up to which audio is truncated, in milliseconds. If
  the audio_end_ms is greater than the actual audio duration, the server
  will respond with an error.

  * `:content_index` - **required** - `integer()`
    The index of the content part to truncate. Set this to `0`.

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:item_id` - **required** - `String.t()`
    The ID of the assistant message item to truncate. Only assistant message
  items can be truncated.

  * `:type` - **required** - `:"conversation.item.truncate"`
    The event type, must be `conversation.item.truncate`.
    Allowed values: `"conversation.item.truncate"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_end_ms: integer(),
          content_index: integer(),
          event_id: String.t() | nil,
          item_id: String.t(),
          type: :"conversation.item.truncate"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:audio_end_ms) => integer(),
              required(:content_index) => integer(),
              optional(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) => :"conversation.item.truncate" | String.t()
            }
  defstruct [:audio_end_ms, :content_index, :event_id, :item_id, :type]
end
