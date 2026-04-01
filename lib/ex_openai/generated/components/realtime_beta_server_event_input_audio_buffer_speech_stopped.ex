defmodule ExOpenAI.Components.RealtimeBetaServerEventInputAudioBufferSpeechStopped do
  use ExOpenAI.Jason

  @moduledoc """
  Returned in `server_vad` mode when the server detects the end of speech in 
  the audio buffer. The server will also send an `conversation.item.created` 
  event with the user message item that is created from the audio buffer.


  ## Fields

  * `:audio_end_ms` - **required** - `integer()`  
    Milliseconds since the session started when speech stopped. This will 
  correspond to the end of audio sent to the model, and thus includes the 
  `min_silence_duration_ms` configured in the Session.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the user message item that will be created.

  * `:type` - **required** - `:"input_audio_buffer.speech_stopped"`  
    The event type, must be `input_audio_buffer.speech_stopped`.  
    Allowed values: `"input_audio_buffer.speech_stopped"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio_end_ms: integer(),
          event_id: String.t(),
          item_id: String.t(),
          type: :"input_audio_buffer.speech_stopped"
        }
  defstruct [:audio_end_ms, :event_id, :item_id, :type]
end
