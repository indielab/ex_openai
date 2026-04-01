defmodule ExOpenAI.Components.RealtimeServerEventOutputAudioBufferCleared do
  use ExOpenAI.Jason

  @moduledoc """
  **WebRTC/SIP Only:** Emitted when the output audio buffer is cleared. This happens either in VAD
  mode when the user has interrupted (`input_audio_buffer.speech_started`),
  or when the client has emitted the `output_audio_buffer.clear` event to manually
  cut off the current audio response.
  [Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:response_id` - **required** - `String.t()`  
    The unique ID of the response that produced the audio.

  * `:type` - **required** - `:"output_audio_buffer.cleared"`  
    The event type, must be `output_audio_buffer.cleared`.  
    Allowed values: `"output_audio_buffer.cleared"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          response_id: String.t(),
          type: :"output_audio_buffer.cleared"
        }
  defstruct [:event_id, :response_id, :type]
end
