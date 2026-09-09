defmodule ExOpenAI.Components.RealtimeTranslationClientEventInputAudioBufferAppend do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to append audio bytes to the translation session input audio buffer.

  WebSocket translation sessions accept base64-encoded 24 kHz PCM16 mono
  little-endian raw audio bytes. Unsupported websocket audio formats return a
  validation error because lower-quality audio materially degrades translation
  quality.

  Translation consumes 200 ms engine frames. For best realtime behavior, append
  audio in 200 ms chunks. If a chunk is shorter, the server buffers it until it
  has enough audio for one frame. If a chunk is longer, the server splits it into
  200 ms frames and enqueues them back-to-back.

  Keep appending silence while the session is active. If a client stops sending
  audio and later resumes, model time treats the resumed audio as contiguous with
  the previous audio rather than as a real-world pause.


  ## Fields

  * `:audio` - **required** - `String.t()`
    Base64-encoded 24 kHz PCM16 mono audio bytes.

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:type` - **required** - `:"session.input_audio_buffer.append"`
    The event type, must be `session.input_audio_buffer.append`.
    Allowed values: `"session.input_audio_buffer.append"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio: String.t(),
          event_id: String.t() | nil,
          type: :"session.input_audio_buffer.append"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:audio) => String.t(),
              optional(:event_id) => String.t(),
              required(:type) => :"session.input_audio_buffer.append" | String.t()
            }
  defstruct [:audio, :event_id, :type]
end
