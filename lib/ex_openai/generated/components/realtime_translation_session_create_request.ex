defmodule ExOpenAI.Components.RealtimeTranslationSessionCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime translation session configuration. Translation sessions stream source
  audio in and translated audio plus transcript deltas out continuously.


  ## Fields

  * `:audio` - **optional** - `%{ optional(:input) => %{ optional(:noise_reduction) => %{required(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil, optional(:transcription) => %{required(:model) => String.t()} | nil }, optional(:output) => %{optional(:language) => String.t()} }`
    Configuration for translation input and output audio.

  * `:model` - **required** - `String.t()`
    The Realtime translation model used for this session.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio:
            %{
              optional(:input) => %{
                optional(:noise_reduction) =>
                  %{required(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil,
                optional(:transcription) => %{required(:model) => String.t()} | nil
              },
              optional(:output) => %{optional(:language) => String.t()}
            }
            | nil,
          model: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:audio) => %{
                optional(:input) => %{
                  optional(:noise_reduction) =>
                    %{required(:type) => ExOpenAI.Components.NoiseReductionType.input()} | nil,
                  optional(:transcription) => %{required(:model) => String.t()} | nil
                },
                optional(:output) => %{optional(:language) => String.t()}
              },
              required(:model) => String.t()
            }
  defstruct [:audio, :model]
end
