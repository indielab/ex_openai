defmodule ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  A new Realtime transcription session configuration.

  When a session is created on the server via REST API, the session object
  also contains an ephemeral key. Default TTL for keys is 10 minutes. This
  property is not present when a session is updated via the WebSocket API.


  ## Fields

  * `:client_secret` - **required** - `{:%{}, [], [{{:required, [], [:expires_at]}, {:integer, [], []}}, {{:required, [], [:value]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Ephemeral key returned by the API. Only present when the session is
  created on the server via REST API.

  * `:input_audio_format` - **optional** - `String.t()`  
    The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.

  * `:input_audio_transcription` - **optional** - `ExOpenAI.Components.AudioTranscription.t()`  
    Configuration of the transcription model.

  * `:modalities` - **optional** - `any()`  
    The set of modalities the model can respond with. To disable audio,
  set this to ["text"].

  * `:turn_detection` - **optional** - `{:%{}, [], [{{:optional, [], [:prefix_padding_ms]}, {:integer, [], []}}, {{:optional, [], [:silence_duration_ms]}, {:integer, [], []}}, {{:optional, [], [:threshold]}, {:number, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Configuration for turn detection. Can be set to `null` to turn off. Server
  VAD means that the model will detect the start and end of speech based on
  audio volume and respond at the end of user speech.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          client_secret: %{required(:expires_at) => integer(), required(:value) => String.t()},
          input_audio_format: String.t() | nil,
          input_audio_transcription: ExOpenAI.Components.AudioTranscription.t() | nil,
          modalities: any() | nil,
          turn_detection:
            %{
              optional(:prefix_padding_ms) => integer(),
              optional(:silence_duration_ms) => integer(),
              optional(:threshold) => number(),
              optional(:type) => String.t()
            }
            | nil
        }
  defstruct [
    :client_secret,
    :input_audio_format,
    :input_audio_transcription,
    :modalities,
    :turn_detection
  ]
end
