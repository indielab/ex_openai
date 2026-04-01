defmodule ExOpenAI.Components.SpeechAudioDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted for each chunk of audio data generated during speech synthesis.

  ## Fields

  * `:audio` - **required** - `String.t()`  
    A chunk of Base64-encoded audio data.

  * `:type` - **required** - `:"speech.audio.delta"`  
    The type of the event. Always `speech.audio.delta`.  
    Allowed values: `"speech.audio.delta"`
  """
  @type t() :: %{__struct__: __MODULE__, audio: String.t(), type: :"speech.audio.delta"}
  defstruct [:audio, :type]
end
