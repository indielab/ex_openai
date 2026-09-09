defmodule ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime transcription session configuration object.


  ## Fields

  * `:audio` - **optional** - `%{ optional(:input) => %{ optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(), optional(:noise_reduction) => %{optional(:type) => ExOpenAI.Components.NoiseReductionType.t()}, optional(:transcription) => ExOpenAI.Components.AudioTranscriptionResponse.t(), optional(:turn_detection) => %{ optional(:prefix_padding_ms) => integer(), optional(:silence_duration_ms) => integer(), optional(:threshold) => number(), optional(:type) => String.t() } | nil } }`
    Configuration for input audio for the session.

  * `:expires_at` - **optional** - `integer()`
    Expiration timestamp for the session, in seconds since epoch.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    Unique identifier for the session that looks like `sess_1234567890abcdef`.

  * `:include` - **optional** - `list(:"item.input_audio_transcription.logprobs")`
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
                optional(:transcription) => ExOpenAI.Components.AudioTranscriptionResponse.t(),
                optional(:turn_detection) =>
                  %{
                    optional(:prefix_padding_ms) => integer(),
                    optional(:silence_duration_ms) => integer(),
                    optional(:threshold) => number(),
                    optional(:type) => String.t()
                  }
                  | nil
              }
            }
            | nil,
          expires_at: integer() | nil,
          id: String.t(),
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          object: String.t(),
          type: :transcription
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:audio) => %{
                optional(:input) => %{
                  optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.input(),
                  optional(:noise_reduction) => %{
                    optional(:type) => ExOpenAI.Components.NoiseReductionType.input()
                  },
                  optional(:transcription) =>
                    ExOpenAI.Components.AudioTranscriptionResponse.input(),
                  optional(:turn_detection) =>
                    %{
                      optional(:prefix_padding_ms) => integer(),
                      optional(:silence_duration_ms) => integer(),
                      optional(:threshold) => number(),
                      optional(:type) => String.t()
                    }
                    | nil
                }
              },
              optional(:expires_at) => integer(),
              required(:id) => String.t(),
              optional(:include) => list(:"item.input_audio_transcription.logprobs" | String.t()),
              required(:object) => String.t(),
              required(:type) => :transcription | String.t()
            }
  defstruct [:audio, :expires_at, :id, :include, :object, :type]
end
