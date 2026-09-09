defmodule ExOpenAI.Components.RealtimeResponseCreateParams do
  use ExOpenAI.Jason

  @moduledoc """
  Create a new Realtime response with these parameters

  ## Fields

  * `:audio` - **optional** - `%{ optional(:output) => %{ optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(), optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.t() } }`
    Configuration for audio input and output.

  * `:conversation` - **optional** - `String.t() | :auto | :none`
    Controls which conversation the response is added to. Currently supports
  `auto` and `none`, with `auto` as the default value. The `auto` value
  means that the contents of the response will be added to the default
  conversation. Set this to `none` to create an out-of-band response which
  will not add items to default conversation.

  * `:input` - **optional** - `list(ExOpenAI.Components.RealtimeConversationItem.t())`
    Input items to include in the prompt for the model. Using this field
  creates a new context for this Response instead of using the default
  conversation. An empty array `[]` will clear the context for this Response.
  Note that this can include references to items that previously appeared in the session
  using their id.

  * `:instructions` - **optional** - `String.t()`
    The default system instructions (i.e. system message) prepended to model calls. This field allows the client to guide the model on desired responses. The model can be instructed on response content and format, (e.g. "be extremely succinct", "act friendly", "here are examples of good responses") and on audio behavior (e.g. "talk quickly", "inject emotion into your voice", "laugh frequently"). The instructions are not guaranteed to be followed by the model, but they provide guidance to the model on the desired behavior.
  Note that the server sets default instructions which will be used if this field is not set and are visible in the `session.created` event at the start of the session.

  * `:max_output_tokens` - **optional** - `integer() | :inf`
    Maximum number of output tokens for a single assistant response,
  inclusive of tool calls. Provide an integer between 1 and 4096 to
  limit output tokens, or `inf` for the maximum available tokens for a
  given model. Defaults to `inf`.

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:output_modalities` - **optional** - `list(:text | :audio)`
    The set of modalities the model used to respond, currently the only possible values are
  `[\\"audio\\"]`, `[\\"text\\"]`. Audio output always include a text transcript. Setting the
  output to mode `text` will disable audio output from the model.

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
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio:
            %{
              optional(:output) => %{
                optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.t(),
                optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.t()
              }
            }
            | nil,
          conversation: (String.t() | :auto | :none) | nil,
          input: list(ExOpenAI.Components.RealtimeConversationItem.t()) | nil,
          instructions: String.t() | nil,
          max_output_tokens: (integer() | :inf) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
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
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:audio) => %{
                optional(:output) => %{
                  optional(:format) => ExOpenAI.Components.RealtimeAudioFormats.input(),
                  optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.input()
                }
              },
              optional(:conversation) => String.t() | (:auto | :none) | String.t(),
              optional(:input) => list(ExOpenAI.Components.RealtimeConversationItem.input()),
              optional(:instructions) => String.t(),
              optional(:max_output_tokens) => integer() | :inf | String.t(),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
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
                )
            }
  defstruct [
    :audio,
    :conversation,
    :input,
    :instructions,
    :max_output_tokens,
    :metadata,
    :output_modalities,
    :parallel_tool_calls,
    :prompt,
    :reasoning,
    :tool_choice,
    :tools
  ]
end
