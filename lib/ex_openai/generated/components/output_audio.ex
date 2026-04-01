defmodule ExOpenAI.Components.OutputAudio do
  use ExOpenAI.Jason

  @moduledoc """
  An audio output from the model.


  ## Fields

  * `:data` - **required** - `String.t()`  
    Base64-encoded audio data from the model.

  * `:transcript` - **required** - `String.t()`  
    The transcript of the audio data from the model.

  * `:type` - **required** - `:output_audio`  
    The type of the output audio. Always `output_audio`.  
    Allowed values: `"output_audio"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: String.t(),
          transcript: String.t(),
          type: :output_audio
        }
  defstruct [:data, :transcript, :type]
end
