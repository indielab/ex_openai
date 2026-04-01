defmodule ExOpenAI.Components.RealtimeClientEventInputAudioBufferCommit do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to commit the user input audio buffer, which will create a  new user message item in the conversation. This event will produce an error  if the input audio buffer is empty. When in Server VAD mode, the client does  not need to send this event, the server will commit the audio buffer  automatically.

  Committing the input audio buffer will trigger input audio transcription  (if enabled in session configuration), but it will not create a response  from the model. The server will respond with an `input_audio_buffer.committed` event.


  ## Fields

  * `:event_id` - **optional** - `String.t()`  
    Optional client-generated ID used to identify this event.  
    Constraints: maxLength: 512

  * `:type` - **required** - `:"input_audio_buffer.commit"`  
    The event type, must be `input_audio_buffer.commit`.  
    Allowed values: `"input_audio_buffer.commit"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          type: :"input_audio_buffer.commit"
        }
  defstruct [:event_id, :type]
end
