defmodule ExOpenAI.Components.RealtimeSessionCreateRequestGA do
  use ExOpenAI.Jason

  @moduledoc """
  Realtime session object configuration.

  ## Fields

  * `:audio` - **optional** - `%{ optional(:input) => %{ optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(), optional(:noise_reduction) => %{optional(:type) => ExOpenAI.Components.NoiseReductionType.t()}, optional(:transcription) => ExOpenAI.Components.AudioTranscription.t(), optional(:turn_detection) => ExOpenAI.Components.RealtimeTurnDetection.t() }, optional(:output) => %{ optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(), optional(:speed) => number(), optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.t() } }`
    Configuration for input and output audio.

  * `:include` - **optional** - `list(:"item.input_audio_transcription.logprobs")`
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

  * `:model` - **optional** - `String.t() | :"gpt-realtime" | :"gpt-realtime-1.5" | :"gpt-realtime-2" | :"gpt-realtime-2.1" | :"gpt-realtime-2.1-mini" | :"gpt-realtime-2025-08-28" | :"gpt-4o-realtime-preview" | :"gpt-4o-realtime-preview-2024-10-01" | :"gpt-4o-realtime-preview-2024-12-17" | :"gpt-4o-realtime-preview-2025-06-03" | :"gpt-4o-mini-realtime-preview" | :"gpt-4o-mini-realtime-preview-2024-12-17" | :"gpt-realtime-mini" | :"gpt-realtime-mini-2025-10-06" | :"gpt-realtime-mini-2025-12-15" | :"gpt-audio-1.5" | :"gpt-audio-mini" | :"gpt-audio-mini-2025-10-06" | :"gpt-audio-mini-2025-12-15"`
    The Realtime model used for this session.

  * `:output_modalities` - **optional** - `list(:text | :audio)`
    The set of modalities the model can respond with. It defaults to `["audio"]`, indicating
  that the model will respond with audio plus a transcript. `["text"]` can be used to make
  the model respond with text only. It is not possible to request both `text` and `audio` at the same time.
    Default: `["audio"]`

  * `:parallel_tool_calls` - **optional** - `boolean()`
    Whether the model may call multiple tools in parallel. Only supported by
  reasoning Realtime models such as `gpt-realtime-2`.

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:reasoning` - **optional** - `ExOpenAI.Components.RealtimeReasoning.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t()`
    How the model chooses tools. Provide one of the string modes or force a specific
  function/MCP tool.
    Default: `"auto"`

  * `:tools` - **optional** - `list(ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t())`
    Tools available to the model.

  * `:tracing` - **optional** - `:auto | %{ optional(:group_id) => String.t(), optional(:metadata) => map(), optional(:workflow_name) => String.t() } | nil`
    Realtime API can write session traces to the [Traces Dashboard](https://platform.openai.com/logs?api=traces). Set to null to disable tracing. Once
  tracing is enabled for a session, the configuration cannot be modified.

  `auto` will create a trace for the session with default values for the
  workflow name, group id, and metadata.
    Default: `nil`

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
                optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.t()
              }
            }
            | nil,
          include: list(:"item.input_audio_transcription.logprobs") | nil,
          instructions: String.t() | nil,
          max_output_tokens: (integer() | :inf) | nil,
          model:
            (String.t()
             | (((((((((((((((((:"gpt-realtime" | :"gpt-realtime-1.5") | :"gpt-realtime-2")
                              | :"gpt-realtime-2.1")
                             | :"gpt-realtime-2.1-mini")
                            | :"gpt-realtime-2025-08-28")
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
          parallel_tool_calls: boolean() | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          reasoning: ExOpenAI.Components.RealtimeReasoning.t() | nil,
          tool_choice:
            ((ExOpenAI.Components.ToolChoiceOptions.t()
              | ExOpenAI.Components.ToolChoiceFunction.t())
             | ExOpenAI.Components.ToolChoiceMCP.t())
            | nil,
          tools:
            list(ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t())
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
          type: :realtime
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
                  optional(:transcription) => ExOpenAI.Components.AudioTranscription.input(),
                  optional(:turn_detection) => ExOpenAI.Components.RealtimeTurnDetection.input()
                },
                optional(:output) => %{
                  optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.input(),
                  optional(:speed) => number(),
                  optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.input()
                }
              },
              optional(:include) => list(:"item.input_audio_transcription.logprobs" | String.t()),
              optional(:instructions) => String.t(),
              optional(:max_output_tokens) => integer() | :inf | String.t(),
              optional(:model) =>
                String.t()
                | ((((((((((((((((((:"gpt-realtime" | :"gpt-realtime-1.5") | :"gpt-realtime-2")
                                  | :"gpt-realtime-2.1")
                                 | :"gpt-realtime-2.1-mini")
                                | :"gpt-realtime-2025-08-28")
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
                | String.t(),
              optional(:output_modalities) => list((:text | :audio) | String.t()),
              optional(:parallel_tool_calls) => boolean(),
              optional(:prompt) => ExOpenAI.Components.Prompt.input(),
              optional(:reasoning) => ExOpenAI.Components.RealtimeReasoning.input(),
              optional(:tool_choice) =>
                (ExOpenAI.Components.ToolChoiceOptions.input()
                 | ExOpenAI.Components.ToolChoiceFunction.input())
                | ExOpenAI.Components.ToolChoiceMCP.input(),
              optional(:tools) =>
                list(
                  ExOpenAI.Components.RealtimeFunctionTool.input()
                  | ExOpenAI.Components.MCPTool.input()
                ),
              optional(:tracing) =>
                ((:auto | String.t())
                 | %{
                     optional(:group_id) => String.t(),
                     optional(:metadata) => map(),
                     optional(:workflow_name) => String.t()
                   })
                | nil,
              optional(:truncation) => ExOpenAI.Components.RealtimeTruncation.input(),
              required(:type) => :realtime | String.t()
            }
  defstruct [
    :audio,
    :include,
    :instructions,
    :max_output_tokens,
    :model,
    :output_modalities,
    :parallel_tool_calls,
    :prompt,
    :reasoning,
    :tool_choice,
    :tools,
    :tracing,
    :truncation,
    :type
  ]
end
