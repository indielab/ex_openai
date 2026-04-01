defmodule ExOpenAI.Components.RealtimeSessionCreateResponseGA do
  use ExOpenAI.Jason

  @moduledoc """
  A new Realtime session configuration, with an ephemeral key. Default TTL
  for keys is one minute.


  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:optional, [], [:input]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:noise_reduction]}, {:%{}, [], [{{:optional, [], [:type]}, {{:., [], [ExOpenAI.Components.NoiseReductionType, :t]}, [], []}}]}}, {{:optional, [], [:transcription]}, {{:., [], [ExOpenAI.Components.AudioTranscription, :t]}, [], []}}, {{:optional, [], [:turn_detection]}, {{:., [], [ExOpenAI.Components.RealtimeTurnDetection, :t]}, [], []}}]}}, {{:optional, [], [:output]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:speed]}, {:number, [], []}}, {{:optional, [], [:voice]}, {{:., [], [ExOpenAI.Components.VoiceIdsShared, :t]}, [], []}}]}}]}`  
    Configuration for input and output audio.

  * `:client_secret` - **required** - `{:%{}, [], [{{:required, [], [:expires_at]}, {:integer, [], []}}, {{:required, [], [:value]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Ephemeral key returned by the API.

  * `:include` - **optional** - `[:"item.input_audio_transcription.logprobs"]`  
    Additional fields to include in server outputs.

  `item.input_audio_transcription.logprobs`: Include logprobs for input audio transcription.

  * `:instructions` - **optional** - `String.t()`  
    The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. "be extremely succinct", "act friendly", "here are examples of good responses") and on audio behavior (e.g. "talk quickly", "inject emotion into your voice", "laugh frequently"). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.

  Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.

  * `:max_output_tokens` - **optional** - `integer() | :inf`  
    Maximum number of output tokens for a single assistant response,
  inclusive of tool calls. Provide an integer between 1 and 4096 to
  limit output tokens, or `inf` for the maximum available tokens for a
  given model. Defaults to `inf`.

  * `:model` - **optional** - `String.t() | :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2025-08-28" | :"gpt-4o-realtime-preview" | :"gpt-4o-realtime-preview-2024-10-01" | :"gpt-4o-realtime-preview-2024-12-17" | :"gpt-4o-realtime-preview-2025-06-03" | :"gpt-4o-mini-realtime-preview" | :"gpt-4o-mini-realtime-preview-2024-12-17" | :"gpt-realtime-mini" | :"gpt-realtime-mini-2025-10-06" | :"gpt-realtime-mini-2025-12-15" | :"gpt-audio-1.5" | :"gpt-audio-mini" | :"gpt-audio-mini-2025-10-06" | :"gpt-audio-mini-2025-12-15"`  
    The Realtime model used for this session.

  * `:output_modalities` - **optional** - `[:text | :audio]`  
    The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
  that the model will respond with audio plus a transcript. `["text"]` can be used to make
  the model respond with text only. It is not possible to request both `text` and `audio` at the same time.  
    Default: `["audio"]`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t()`  
    How the model chooses tools. Provide one of the string modes or force a specific
  function/MCP tool.  
    Default: `"auto"`

  * `:tools` - **optional** - `[ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t()]`  
    Tools available to the model.

  * `:tracing` - **optional** - `:auto | {:%{}, [], [{{:optional, [], [:group_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:metadata]}, {:map, [], []}}, {{:optional, [], [:workflow_name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`

  * `:truncation` - **optional** - `ExOpenAI.Components.RealtimeTruncation.t()`

  * `:type` - **required** - `:realtime`  
    The type of session to create. Always `realtime` for the Realtime API.  
    Allowed values: `"realtime"`
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
              },
              optional(:output) => %{
                optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(),
                optional(:speed) => number(),
                optional(:voice) => ExOpenAI.Components.VoiceIdsShared.t()
              }
            }
            | nil,
          client_secret: %{required(:expires_at) => integer(), required(:value) => String.t()},
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          instructions: String.t() | nil,
          max_output_tokens: (integer() | :inf) | nil,
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
          output_modalities: list(:text | :audio) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          tool_choice:
            ((ExOpenAI.Components.ToolChoiceOptions.t()
              | ExOpenAI.Components.ToolChoiceFunction.t())
             | ExOpenAI.Components.ToolChoiceMCP.t())
            | nil,
          tools:
            list(ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t())
            | nil,
          tracing:
            ((:auto
              | %{
                  optional(:group_id) => String.t(),
                  optional(:metadata) => map(),
                  optional(:workflow_name) => String.t()
                })
             | any())
            | nil,
          truncation: ExOpenAI.Components.RealtimeTruncation.t() | nil,
          type: :realtime
        }
  defstruct [
    :audio,
    :client_secret,
    :include,
    :instructions,
    :max_output_tokens,
    :model,
    :output_modalities,
    :prompt,
    :tool_choice,
    :tools,
    :tracing,
    :truncation,
    :type
  ]
end
