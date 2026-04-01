defmodule ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime transcription session configuration object.


  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:optional, [], [:input]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:noise_reduction]}, {:%{}, [], [{{:optional, [], [:type]}, {{:., [], [ExOpenAI.Components.NoiseReductionType, :t]}, [], []}}]}}, {{:optional, [], [:transcription]}, {{:., [], [ExOpenAI.Components.AudioTranscription, :t]}, [], []}}, {{:optional, [], [:turn_detection]}, {:%{}, [], [{{:optional, [], [:prefix_padding_ms]}, {:integer, [], []}}, {{:optional, [], [:silence_duration_ms]}, {:integer, [], []}}, {{:optional, [], [:threshold]}, {:number, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}}]}}]}`  
    Configuration for input audio for the session.

  * `:expires_at` - **optional** - `integer()`  
    Expiration timestamp for the session, in seconds since epoch.

  * `:id` - **required** - `String.t()`  
    Unique identifier for the session that looks like `sess_1234567890abcdef`.

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"]`  
    Additional fields to include in server outputs.
  - `item.input_audio_transcription.logprobs`: Include logprobs for input audio transcription.

  * `:object` - **required** - `String.t()`  
    The object type. Always `realtime.transcription_session`.

  * `:type` - **required** - `:transcription`  
    The type of session. Always `transcription` for transcription sessions.  
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
                optional(:turn_detection) => %{
                  optional(:prefix_padding_ms) => integer(),
                  optional(:silence_duration_ms) => integer(),
                  optional(:threshold) => number(),
                  optional(:type) => String.t()
                }
              }
            }
            | nil,
          expires_at: integer() | nil,
          id: String.t(),
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          object: String.t(),
          type: :transcription
        }
  defstruct [:audio, :expires_at, :id, :include, :object, :type]
end
