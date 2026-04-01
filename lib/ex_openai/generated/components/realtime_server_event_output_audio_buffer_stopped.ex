defmodule ExOpenAI.Components.RealtimeServerEventOutputAudioBufferStopped do
  use ExOpenAI.Jason

  @moduledoc """
  **WebRTC/SIP Only:** Emitted when the output audio buffer has been completely drained on the server,
  and no more audio is forthcoming. This event is emitted after the full response
  data has been sent to the client (`response.done`).
  [Learn more](/docs/guides/realtime-conversations#client-and-server-events-for-audio-in-webrtc).


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:response_id` - **required** - `String.t()`  
    The unique ID of the response that produced the audio.

  * `:type` - **required** - `:"output_audio_buffer.stopped"`  
    The event type, must be `output_audio_buffer.stopped`.  
    Allowed values: `"output_audio_buffer.stopped"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          response_id: String.t(),
          type: :"output_audio_buffer.stopped"
        }
  defstruct [:event_id, :response_id, :type]
end
