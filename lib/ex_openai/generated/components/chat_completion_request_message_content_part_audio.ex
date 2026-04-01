defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartAudio do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [audio inputs](/docs/guides/audio).


  ## Fields

  * `:input_audio` - **required** - `{:%{}, [], [{{:required, [], [:data]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:format]}, {:|, [], [:wav, :mp3]}}]}`

  * `:type` - **required** - `:input_audio`  
    The type of the content part. Always `input_audio`.  
    Allowed values: `"input_audio"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_audio: %{required(:data) => String.t(), required(:format) => :wav | :mp3},
          type: :input_audio
        }
  defstruct [:input_audio, :type]
end
