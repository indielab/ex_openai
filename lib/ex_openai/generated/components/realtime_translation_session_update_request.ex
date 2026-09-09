defmodule ExOpenAI.Components.RealtimeTranslationSessionUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime translation session fields that can be updated with `session.update`.


  ## Fields

  * `:audio` - **optional** - `%{ optional(:input) => %{ optional(:noise_reduction) => %{required(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil, optional(:transcription) => %{required(:model) => String.t()} | nil }, optional(:output) => %{optional(:language) => String.t()} }`
    Configuration for translation input and output audio.
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
            | nil
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
              }
            }
  defstruct [:audio]
end
