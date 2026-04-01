defmodule ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequestGA do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime transcription session object configuration.

  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:optional, [], [:input]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:noise_reduction]}, {:%{}, [], [{{:optional, [], [:type]}, {{:., [], [ExOpenAI.Components.NoiseReductionType, :t]}, [], []}}]}}, {{:optional, [], [:transcription]}, {{:., [], [ExOpenAI.Components.AudioTranscription, :t]}, [], []}}, {{:optional, [], [:turn_detection]}, {{:., [], [ExOpenAI.Components.RealtimeTurnDetection, :t]}, [], []}}]}}]}`  
    Configuration for input and output audio.

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"]`  
    Additional fields to include in server outputs.

  `item.input_audio_transcription.logprobs`: Include logprobs for input audio transcription.

  * `:type` - **required** - `:transcription`  
    The type of session to create. Always `transcription` for transcription sessions.  
    Allowed values: `"transcription"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio:
            %{
              optional(:input) => %{
                optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(),
                optional(:noise_reduction) => %{
                  optional(:type) => ExOpenAI.Components.NoiseReductionType.t()
                },
                optional(:transcription) => ExOpenAI.Components.AudioTranscription.t(),
                optional(:turn_detection) => ExOpenAI.Components.RealtimeTurnDetection.t()
              }
            }
            | nil,
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          type: :transcription
        }
  defstruct [:audio, :include, :type]
end
