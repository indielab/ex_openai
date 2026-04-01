defmodule ExOpenAI.Components.RealtimeBetaClientEventInputAudioBufferClear do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to clear the audio bytes in the buffer. The server will 
  respond with an `input_audio_buffer.cleared` event.


  ## Fields

  * `:event_id` - **optional** - `String.t()`  
    Optional client-generated ID used to identify this event.

  * `:type` - **required** - `:"input_audio_buffer.clear"`  
    The event type, must be `input_audio_buffer.clear`.  
    Allowed values: `"input_audio_buffer.clear"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          type: :"input_audio_buffer.clear"
        }
  defstruct [:event_id, :type]
end
