defmodule ExOpenAI.Components.ResponseAudioTranscriptDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial transcript of audio.

  ## Fields

  * `:delta` - **required** - `String.t()`  
    The partial transcript of the audio response.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.audio.transcript.delta"`  
    The type of the event. Always `response.audio.transcript.delta`.  
    Allowed values: `"response.audio.transcript.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          sequence_number: integer(),
          type: :"response.audio.transcript.delta"
        }
  defstruct [:delta, :sequence_number, :type]
end
