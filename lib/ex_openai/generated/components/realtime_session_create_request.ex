defmodule ExOpenAI.Components.RealtimeSessionCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  A new Realtime session configuration, with an ephemeral key. Default TTL
  for keys is one minute.


  ## Fields

  * `:client_secret` - **required** - `%{required(:expires_at) => integer(), required(:value) => String.t()}`
    Ephemeral key returned by the API.

  * `:input_audio_format` - **optional** - `String.t()`
    The format of input audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.

  * `:input_audio_transcription` - **optional** - `%{optional(:model) => String.t()}`
    Configuration for input audio transcription, defaults to off and can be
  set to `null` to turn off once on. Input audio transcription is not native
  to the model, since the model consumes audio directly. Transcription runs
  asynchronously and should be treated as rough guidance
  rather than the representation understood by the model.

  * `:instructions` - **optional** - `String.t()`
    The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. "be extremely succinct", "act friendly", "here are examples of good responses") and on audio behavior (e.g. "talk quickly", "inject emotion into your voice", "laugh frequently"). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
  Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.

  * `:max_response_output_tokens` - **optional** - `integer() | :inf`
    Maximum number of output tokens for a single assistant response,
  inclusive of tool calls. Provide an integer between 1 and 4096 to
  limit output tokens, or `inf` for the maximum available tokens for a
  given model. Defaults to `inf`.

  * `:modalities` - **optional** - `any()`
    The set of modalities the model can respond with. To disable audio,
  set this to ["text"].

  * `:output_audio_format` - **optional** - `String.t()`
    The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:speed` - **optional** - `number()`
    The speed of the model's spoken response. 1.0 is the default speed. 0.25 is
  the minimum speed. 1.5 is the maximum speed. This value can only be changed
  in between model turns, not while a response is in progress.
    Default: `1`
    Constraints: minimum: 0.25, maximum: 1.5

  * `:temperature` - **optional** - `number()`
    Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.

  * `:tool_choice` - **optional** - `String.t()`
    How the model chooses tools. Options are `auto`, `none`, `required`, or
  specify a function.

  * `:tools` - **optional** - `list(%{ optional(:description) => String.t(), optional(:name) => String.t(), optional(:parameters) => map(), optional(:type) => :function })`
    Tools (functions) available to the model.

  * `:tracing` - **optional** - `:auto | %{ optional(:group_id) => String.t(), optional(:metadata) => map(), optional(:workflow_name) => String.t() }`
    Configuration options for tracing. Set to null to disable tracing. Once
  tracing is enabled for a session, the configuration cannot be modified.

  `auto` will create a trace for the session with default values for the
  workflow name, group id, and metadata.

  * `:truncation` - **optional** - `ExOpenAI.Components.RealtimeTruncation.t()`

  * `:turn_detection` - **optional** - `%{ optional(:prefix_padding_ms) => integer(), optional(:silence_duration_ms) => integer(), optional(:threshold) => number(), optional(:type) => String.t() }`
    Configuration for turn detection. Can be set to `null` to turn off. Server
  VAD means that the model will detect the start and end of speech based on
  audio volume and respond at the end of user speech.

  * `:voice` - **optional** - `ExOpenAI.Components.VoiceIdsOrCustomVoice.t()`
    The voice the model uses to respond. Supported built-in voices are
  `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
  `marin`, and `cedar`. You may also provide a custom voice object with an
  `id`, for example `{ "id": "voice_1234" }`. Voice cannot be changed during
  the session once the model has responded with audio at least once.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          client_secret: %{required(:expires_at) => integer(), required(:value) => String.t()},
          input_audio_format: String.t() | nil,
          input_audio_transcription: %{optional(:model) => String.t()} | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: (integer() | :inf) | nil,
          modalities: any() | nil,
          output_audio_format: String.t() | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          speed: number() | nil,
          temperature: number() | nil,
          tool_choice: String.t() | nil,
          tools:
            list(%{
              optional(:description) => String.t(),
              optional(:name) => String.t(),
              optional(:parameters) => map(),
              optional(:type) => :function
            })
            | nil,
          tracing:
            (:auto
             | %{
                 optional(:group_id) => String.t(),
                 optional(:metadata) => map(),
                 optional(:workflow_name) => String.t()
               })
            | nil,
          truncation: ExOpenAI.Components.RealtimeTruncation.t() | nil,
          turn_detection:
            %{
              optional(:prefix_padding_ms) => integer(),
              optional(:silence_duration_ms) => integer(),
              optional(:threshold) => number(),
              optional(:type) => String.t()
            }
            | nil,
          voice: ExOpenAI.Components.VoiceIdsOrCustomVoice.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:client_secret) => %{
                required(:expires_at) => integer(),
                required(:value) => String.t()
              },
              optional(:input_audio_format) => String.t(),
              optional(:input_audio_transcription) => %{optional(:model) => String.t()},
              optional(:instructions) => String.t(),
              optional(:max_response_output_tokens) => integer() | :inf | String.t(),
              optional(:modalities) => any(),
              optional(:output_audio_format) => String.t(),
              optional(:prompt) => ExOpenAI.Components.Prompt.input(),
              optional(:speed) => number(),
              optional(:temperature) => number(),
              optional(:tool_choice) => String.t(),
              optional(:tools) =>
                list(%{
                  optional(:description) => String.t(),
                  optional(:name) => String.t(),
                  optional(:parameters) => map(),
                  optional(:type) => :function | String.t()
                }),
              optional(:tracing) =>
                (:auto | String.t())
                | %{
                    optional(:group_id) => String.t(),
                    optional(:metadata) => map(),
                    optional(:workflow_name) => String.t()
                  },
              optional(:truncation) => ExOpenAI.Components.RealtimeTruncation.input(),
              optional(:turn_detection) => %{
                optional(:prefix_padding_ms) => integer(),
                optional(:silence_duration_ms) => integer(),
                optional(:threshold) => number(),
                optional(:type) => String.t()
              },
              optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.input()
            }
  defstruct [
    :client_secret,
    :input_audio_format,
    :input_audio_transcription,
    :instructions,
    :max_response_output_tokens,
    :modalities,
    :output_audio_format,
    :prompt,
    :speed,
    :temperature,
    :tool_choice,
    :tools,
    :tracing,
    :truncation,
    :turn_detection,
    :voice
  ]
end
