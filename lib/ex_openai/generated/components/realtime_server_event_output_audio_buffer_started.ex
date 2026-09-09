defmodule ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStarted do
  use ExOpenAI.Jason

  @moduledoc """
  **WebRTC/SIP Only:** Emitted when the server begins streaming audio to the client. This event is
  emitted after an audio content part has been added (`response.content_part.added`)
  to the response.
  [Learn more](https://platform.openai.com/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:response_id` - **required** - `String.t()`
    The unique ID of the response that produced the audio.

  * `:type` - **required** - `:"output_audio_buffer.started"`
    The event type, must be `output_audio_buffer.started`.
    Allowed values: `"output_audio_buffer.started"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          response_id: String.t(),
          type: :"output_audio_buffer.started"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:response_id) => String.t(),
              required(:type) => :"output_audio_buffer.started" | String.t()
            }
  defstruct [:event_id, :response_id, :type]
end
