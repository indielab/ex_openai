defmodule ExOpenAI.Components.BetaOutputAudio do
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:data) => String.t(),
              required(:transcript) => String.t(),
              required(:type) => :output_audio | String.t()
            }
  defstruct [:data, :transcript, :type]
end
