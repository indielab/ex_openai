defmodule ExOpenAI.Components.InputAudio do
  use ExOpenAI.Jason

  @moduledoc """
  An audio input to the model.


  ## Fields

  * `:input_audio` - **required** - `{:%{}, [], [{{:required, [], [:data]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:format]}, {:|, [], [:mp3, :wav]}}]}`

  * `:type` - **required** - `:input_audio`  
    The type of the input item. Always `input_audio`.  
    Allowed values: `"input_audio"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_audio: %{required(:data) => String.t(), required(:format) => :mp3 | :wav},
          type: :input_audio
        }
  defstruct [:input_audio, :type]
end
