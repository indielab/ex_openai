defmodule ExOpenAI.Components.RealtimeSessionCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime session configuration object.


  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:optional, [], [:input]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:noise_reduction]}, {:%{}, [], [{{:optional, [], [:type]}, {{:., [], [ExOpenAI.Components.NoiseReductionType, :t]}, [], []}}]}}, {{:optional, [], [:transcription]}, {{:., [], [ExOpenAI.Components.AudioTranscription, :t]}, [], []}}, {{:optional, [], [:turn_detection]}, {:%{}, [], [{{:optional, [], [:prefix_padding_ms]}, {:integer, [], []}}, {{:optional, [], [:silence_duration_ms]}, {:integer, [], []}}, {{:optional, [], [:threshold]}, {:number, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}}]}}, {{:optional, [], [:output]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:speed]}, {:number, [], []}}, {{:optional, [], [:voice]}, {{:., [], [ExOpenAI.Components.VoiceIdsShared, :t]}, [], []}}]}}]}`  
    Configuration for input and output audio for the session.

  * `:expires_at` - **optional** - `integer()`  
    Expiration timestamp for the session, in seconds since epoch.

  * `:id` - **optional** - `String.t()`  
    Unique identifier for the session that looks like `sess_1234567890abcdef`.

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"]`  
    Additional fields to include in server outputs.
  - `item.input_audio_transcription.logprobs`: Include logprobs for input audio transcription.

  * `:instructions` - **optional** - `String.t()`  
    The default system instructions (i.e. system message) prepended to model
  calls. This field allows the client to guide the model on desired
  responses. The model can be instructed on response content and format,
  (e.g. "be extremely succinct", "act friendly", "here are examples of good
  responses") and on audio behavior (e.g. "talk quickly", "inject emotion
  into your voice", "laugh frequently"). The instructions are not guaranteed
  to be followed by the model, but they provide guidance to the model on the
  desired behavior.

  Note that the server sets default instructions which will be used if this
  field is not set and are visible in the `session.created` event at the
  start of the session.

  * `:max_output_tokens` - **optional** - `integer() | :inf`  
    Maximum number of output tokens for a single assistant response,
  inclusive of tool calls. Provide an integer between 1 and 4096 to
  limit output tokens, or `inf` for the maximum available tokens for a
  given model. Defaults to `inf`.

  * `:model` - **optional** - `String.t()`  
    The Realtime model used for this session.

  * `:object` - **optional** - `String.t()`  
    The object type. Always `realtime.session`.

  * `:output_modalities` - **optional** - `any()`  
    The set of modalities the model can respond with. To disable audio,
  set this to ["text"].

  * `:tool_choice` - **optional** - `String.t()`  
    How the model chooses tools. Options are `auto`, `none`, `required`, or
  specify a function.

  * `:tools` - **optional** - `[ExOpenAI.Components.RealtimeFunctionTool.t()]`  
    Tools (functions) available to the model.

  * `:tracing` - **optional** - `:auto | {:%{}, [], [{{:optional, [], [:group_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:metadata]}, {:map, [], []}}, {{:optional, [], [:workflow_name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Configuration options for tracing. Set to null to disable tracing. Once
  tracing is enabled for a session, the configuration cannot be modified.

  `auto` will create a trace for the session with default values for the
  workflow name, group id, and metadata.

  * `:turn_detection` - **optional** - `{:%{}, [], [{{:optional, [], [:prefix_padding_ms]}, {:integer, [], []}}, {{:optional, [], [:silence_duration_ms]}, {:integer, [], []}}, {{:optional, [], [:threshold]}, {:number, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Configuration for turn detection. Can be set to `null` to turn off. Server
  VAD means that the model will detect the start and end of speech based on
  audio volume and respond at the end of user speech.
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
              },
              optional(:output) => %{
                optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(),
                optional(:speed) => number(),
                optional(:voice) => ExOpenAI.Components.VoiceIdsShared.t()
              }
            }
            | nil,
          expires_at: integer() | nil,
          id: String.t() | nil,
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          instructions: String.t() | nil,
          max_output_tokens: (integer() | :inf) | nil,
          model: String.t() | nil,
          object: String.t() | nil,
          output_modalities: any() | nil,
          tool_choice: String.t() | nil,
          tools: list(ExOpenAI.Components.RealtimeFunctionTool.t()) | nil,
          tracing:
            (:auto
             | %{
                 optional(:group_id) => String.t(),
                 optional(:metadata) => map(),
                 optional(:workflow_name) => String.t()
               })
            | nil,
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
    :audio,
    :expires_at,
    :id,
    :include,
    :instructions,
    :max_output_tokens,
    :model,
    :object,
    :output_modalities,
    :tool_choice,
    :tools,
    :tracing,
    :turn_detection
  ]
end
