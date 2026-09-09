defmodule ExOpenAI.Components.BetaInputAudio do
  use ExOpenAI.Jason

  @moduledoc """
  An audio input to the model.


  ## Fields

  * `:input_audio` - **required** - `%{required(:data) => String.t(), required(:format) => :mp3 | :wav}`

  * `:type` - **required** - `:input_audio`
    The type of the input item. Always `input_audio`.
    Allowed values: `"input_audio"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_audio: %{required(:data) => String.t(), required(:format) => :mp3 | :wav},
          type: :input_audio
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input_audio) => %{
                required(:data) => String.t(),
                required(:format) => (:mp3 | :wav) | String.t()
              },
              required(:type) => :input_audio | String.t()
            }
  defstruct [:input_audio, :type]
end
