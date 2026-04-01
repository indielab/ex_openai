defmodule ExOpenAI.Components.RealtimeBetaClientEventInputAudioBufferAppend do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to append audio bytes to the input audio buffer. The audio 
  buffer is temporary storage you can write to and later commit. In Server VAD 
  mode, the audio buffer is used to detect speech and the server will decide 
  when to commit. When Server VAD is disabled, you must commit the audio buffer
  manually.

  The client may choose how much audio to place in each event up to a maximum 
  of 15 MiB, for example streaming smaller chunks from the client may allow the 
  VAD to be more responsive. Unlike made other client events, the server will 
  not send a confirmation response to this event.


  ## Fields

  * `:audio` - **required** - `String.t()`  
    Base64-encoded audio bytes. This must be in the format specified by the 
  `input_audio_format` field in the session configuration.

  * `:event_id` - **optional** - `String.t()`  
    Optional client-generated ID used to identify this event.

  * `:type` - **required** - `:"input_audio_buffer.append"`  
    The event type, must be `input_audio_buffer.append`.  
    Allowed values: `"input_audio_buffer.append"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio: String.t(),
          event_id: String.t() | nil,
          type: :"input_audio_buffer.append"
        }
  defstruct [:audio, :event_id, :type]
end
