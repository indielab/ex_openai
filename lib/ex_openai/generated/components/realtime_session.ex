defmodule ExOpenAI.Components.RealtimeSession do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime session object for the beta interface.

  ## Fields

  * `:expires_at` - **optional** - `integer()`  
    Expiration timestamp for the session, in seconds since epoch.

  * `:id` - **optional** - `String.t()`  
    Unique identifier for the session that looks like `sess_1234567890abcdef`.

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"] | any()`

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

  * `:input_audio_transcription` - **optional** - `{:%{}, [], [{{:optional, [], [:language]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:model]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:|, [], [{:|, [], [{:|, [], [{:|, [], [:"whisper-1", :"gpt-4o-mini-transcribe"]}, :"gpt-4o-mini-transcribe-2025-12-15"]}, :"gpt-4o-transcribe"]}, :"gpt-4o-transcribe-diarize"]}]}}, {{:optional, [], [:prompt]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`

  * `:instructions` - **optional** - `String.t()`  
    The default system instructions (i.e. system message) prepended to model
  calls. This field allows the client to guide the model on desired
  responses. The model can be instructed on response content and format,
  (e.g. "be extremely succinct", "act friendly", "here are examples of good
  responses") and on audio behavior (e.g. "talk quickly", "inject emotion
  into your voice", "laugh frequently"). The instructions are not
  guaranteed to be followed by the model, but they provide guidance to the
  model on the desired behavior.


  Note that the server sets default instructions which will be used if this
  field is not set and are visible in the `session.created` event at the
  start of the session.

  * `:max_response_output_tokens` - **optional** - `integer() | :inf`  
    Maximum number of output tokens for a single assistant response,
  inclusive of tool calls. Provide an integer between 1 and 4096 to
  limit output tokens, or `inf` for the maximum available tokens for a
  given model. Defaults to `inf`.

  * `:modalities` - **optional** - `any()`  
    The set of modalities the model can respond with. To disable audio,
  set this to ["text"].

  * `:model` - **optional** - `String.t() | :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | :"gpt-4o-realtime-preview" | :"gpt-4o-realtime-preview-2024-10-01" | :"gpt-4o-realtime-preview-2024-12-17" | :"gpt-4o-realtime-preview-2025-06-03" | :"gpt-4o-mini-realtime-preview" | :"gpt-4o-mini-realtime-preview-2024-12-17" | :"gpt-realtime-mini" | :"gpt-realtime-mini-2025-10-06" | :"gpt-realtime-mini-2025-12-15" | :"gpt-audio-1.5" | :"gpt-audio-mini" | :"gpt-audio-mini-2025-10-06" | :"gpt-audio-mini-2025-12-15"`  
    The Realtime model used for this session.

  * `:object` - **optional** - `:"realtime.session"`  
    The object type. Always `realtime.session`.  
    Allowed values: `"realtime.session"`

  * `:output_audio_format` - **optional** - `:pcm16 | :g711_ulaw | :g711_alaw`  
    The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
  For `pcm16`, output audio is sampled at a rate of 24kHz.  
    Allowed values: `"pcm16"`, `"g711_ulaw"`, `"g711_alaw"`  
    Default: `"pcm16"`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t() | any()`

  * `:speed` - **optional** - `number()`  
    The speed of the model's spoken response. 1.0 is the default speed. 0.25 is
  the minimum speed. 1.5 is the maximum speed. This value can only be changed
  in between model turns, not while a response is in progress.  
    Default: `1`  
    Constraints: minimum: 0.25, maximum: 1.5

  * `:temperature` - **optional** - `number()`  
    Sampling temperature for the model, limited to [0.6, 1.2]. For audio models a temperature of 0.8 is highly recommended for best performance.  
    Default: `0.8`

  * `:tool_choice` - **optional** - `String.t()`  
    How the model chooses tools. Options are `auto`, `none`, `required`, or
  specify a function.  
    Default: `"auto"`

  * `:tools` - **optional** - `[ExOpenAI.Components.RealtimeFunctionTool.t()]`  
    Tools (functions) available to the model.

  * `:tracing` - **optional** - `:auto | {:%{}, [], [{{:optional, [], [:group_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:metadata]}, {:map, [], []}}, {{:optional, [], [:workflow_name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`

  * `:turn_detection` - **optional** - `ExOpenAI.Components.RealtimeTurnDetection.t()`

  * `:voice` - **optional** - `ExOpenAI.Components.VoiceIdsShared.t()`  
    The voice the model uses to respond. Voice cannot be changed during the
  session once the model has responded with audio at least once. Current
  voice options are `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`,
  `shimmer`, and `verse`.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_at: integer() | nil,
          id: String.t() | nil,
          include: (list(:"item.input_audio_transcription.logprobs") | any()) | nil,
          input_audio_format: ((:pcm16 | :g711_ulaw) | :g711_alaw) | nil,
          input_audio_noise_reduction:
            %{optional(:type) => ExOpenAI.Components.NoiseReductionType.t()} | nil,
          input_audio_transcription:
            (%{
               optional(:language) => String.t(),
               optional(:model) =>
                 String.t()
                 | (((:"whisper-1" | :"gpt-4o-mini-transcribe")
                     | :"gpt-4o-mini-transcribe-2025-12-15")
                    | :"gpt-4o-transcribe")
                 | :"gpt-4o-transcribe-diarize",
               optional(:prompt) => String.t()
             }
             | any())
            | nil,
          instructions: String.t() | nil,
          max_response_output_tokens: (integer() | :inf) | nil,
          modalities: any() | nil,
          model:
            (String.t()
             | ((((((((((((((:"gpt-realtime" | :"gpt-realtime-1.5") | :"gpt-realtime-2025-08-28")
                           | :"gpt-4o-realtime-preview")
                          | :"gpt-4o-realtime-preview-2024-10-01")
                         | :"gpt-4o-realtime-preview-2024-12-17")
                        | :"gpt-4o-realtime-preview-2025-06-03")
                       | :"gpt-4o-mini-realtime-preview")
                      | :"gpt-4o-mini-realtime-preview-2024-12-17")
                     | :"gpt-realtime-mini")
                    | :"gpt-realtime-mini-2025-10-06")
                   | :"gpt-realtime-mini-2025-12-15")
                  | :"gpt-audio-1.5")
                 | :"gpt-audio-mini")
                | :"gpt-audio-mini-2025-10-06")
             | :"gpt-audio-mini-2025-12-15")
            | nil,
          object: :"realtime.session" | nil,
          output_audio_format: ((:pcm16 | :g711_ulaw) | :g711_alaw) | nil,
          prompt: (ExOpenAI.Components.Prompt.t() | any()) | nil,
          speed: number() | nil,
          temperature: number() | nil,
          tool_choice: String.t() | nil,
          tools: list(ExOpenAI.Components.RealtimeFunctionTool.t()) | nil,
          tracing:
            ((:auto
              | %{
                  optional(:group_id) => String.t(),
                  optional(:metadata) => map(),
                  optional(:workflow_name) => String.t()
                })
             | any())
            | nil,
          turn_detection: ExOpenAI.Components.RealtimeTurnDetection.t() | nil,
          voice: ExOpenAI.Components.VoiceIdsShared.t() | nil
        }
  defstruct [
    :expires_at,
    :id,
    :include,
    :input_audio_format,
    :input_audio_noise_reduction,
    :input_audio_transcription,
    :instructions,
    :max_response_output_tokens,
    :modalities,
    :model,
    :object,
    :output_audio_format,
    :prompt,
    :speed,
    :temperature,
    :tool_choice,
    :tools,
    :tracing,
    :turn_detection,
    :voice
  ]
end
