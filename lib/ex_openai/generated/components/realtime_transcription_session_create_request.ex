defmodule ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime transcription session object configuration.

  ## Fields

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"]`  
    The set of items to include in the transcription. Current available items are:
  `item.input_audio_transcription.logprobs`

  * `:input_audio_format` - **optional** - `:pcm16 | :g711_ulaw | :g711_alaw`  
    The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  For `pcm16`, input audio must be 16-bit PCM at a 24kHz sample rate,
  single channel (mono), and little-endian byte order.  
    Allowed values: `"pcm16"`, `"g711_ulaw"`, `"g711_alaw"`  
    Default: `"pcm16"`

  * `:input_audio_noise_reduction` - **optional** - `{:%{}, [], [{{:optional, [], [:type]}, {{:., [], [ExOpenAI.Components.NoiseReductionType, :t]}, [], []}}]}`  
    Configuration for input audio noise reduction. This can be set to `null` to turn off.
  Noise reduction filters audio added to the input audio buffer before it is sent to VAD and the model.
  Filtering the audio can improve VAD and turn detection accuracy (reducing false positives) and model performance by improving perception of the input audio.  
    Default: `nil`

  * `:input_audio_transcription` - **optional** - `ExOpenAI.Components.AudioTranscription.t()`  
    Configuration for input audio transcription. The client can optionally set the language and prompt for transcription, these offer additional guidance to the transcription service.

  * `:turn_detection` - **optional** - `{:%{}, [], [{{:optional, [], [:prefix_padding_ms]}, {:integer, [], []}}, {{:optional, [], [:silence_duration_ms]}, {:integer, [], []}}, {{:optional, [], [:threshold]}, {:number, [], []}}, {{:optional, [], [:type]}, :server_vad}]}`  
    Configuration for turn detection. Can be set to `null` to turn off. Server VAD means that the model will detect the start and end of speech based on audio volume and respond at the end of user speech.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          input_audio_format: ((:pcm16 | :g711_ulaw) | :g711_alaw) | nil,
          input_audio_noise_reduction:
            %{optional(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil,
          input_audio_transcription: ExOpenAI.Components.AudioTranscription.t() | nil,
          turn_detection:
            %{
              optional(:prefix_padding_ms) => integer(),
              optional(:silence_duration_ms) => integer(),
              optional(:threshold) => number(),
              optional(:type) => :server_vad
            }
            | nil
        }
  defstruct [
    :include,
    :input_audio_format,
    :input_audio_noise_reduction,
    :input_audio_transcription,
    :turn_detection
  ]
end
