defmodule ExOpenAI.Components.RealtimeBetaServerEventInputAudioBufferSpeechStarted do
  use ExOpenAI.Jason

  @moduledoc """
  Sent by the server when in `server_vad` mode to indicate that speech has been
  detected in the audio buffer. This can happen any time audio is added to the
  buffer (unless speech is already detected). The client may want to use this
  event to interrupt audio playback or provide visual feedback to the user.

  The client should expect to receive a `input_audio_buffer.speech_stopped` event
  when speech stops. The `item_id` property is the ID of the user message item
  that will be created when speech stops and will also be included in the
  `input_audio_buffer.speech_stopped` event (unless the client manually commits
  the audio buffer during VAD activation).


  ## Fields

  * `:audio_start_ms` - **required** - `integer()`
    Milliseconds from the start of all audio written to the buffer during the
  session when speech was first detected. This will correspond to the
  beginning of audio sent to the model, and thus includes the
  `prefix_padding_ms` configured in the Session.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the user message item that will be created when speech stops.

  * `:type` - **required** - `:"input_audio_buffer.speech_started"`
    The event type, must be `input_audio_buffer.speech_started`.
    Allowed values: `"input_audio_buffer.speech_started"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_start_ms: integer(),
          event_id: String.t(),
          item_id: String.t(),
          type: :"input_audio_buffer.speech_started"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:audio_start_ms) => integer(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:type) => :"input_audio_buffer.speech_started" | String.t()
            }
  defstruct [:audio_start_ms, :event_id, :item_id, :type]
end
