defmodule ExOpenAI.Components.RealtimeResponseCreateParams do
  use ExOpenAI.Jason

  @moduledoc """
  Create a new Realtime response with these parameters

  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:optional, [], [:output]}, {:%{}, [], [{{:optional, [], [:format]}, {{:., [], [ExOpenAI.Components.RealtimeAudioFormats, :t]}, [], []}}, {{:optional, [], [:voice]}, {{:., [], [ExOpenAI.Components.VoiceIdsOrCustomVoice, :t]}, [], []}}]}}]}`  
    Configuration for audio input and output.

  * `:conversation` - **optional** - `String.t() | :auto | :none`  
    Controls which conversation the response is added to. Currently supports
  `auto` and `none`, with `auto` as the default value. The `auto` value
  means that the contents of the response will be added to the default
  conversation. Set this to `none` to create an out-of-band response which
  will not add items to default conversation.

  * `:input` - **optional** - `[ExOpenAI.Components.RealtimeConversationItem.t()]`  
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

  * `:output_modalities` - **optional** - `[:text | :audio]`  
    The set of modalities the model used to respond, currently the only possible values are
  `[\"audio\"]`, `[\"text\"]`. Audio output always include a text transcript. Setting the
  output to mode `text` will disable audio output from the model.

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t()`  
    How the model chooses tools. Provide one of the string modes or force a specific
  function/MCP tool.  
    Default: `"auto"`

  * `:tools` - **optional** - `[ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t()]`  
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
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          tool_choice:
            ((ExOpenAI.Components.ToolChoiceOptions.t()
              | ExOpenAI.Components.ToolChoiceFunction.t())
             | ExOpenAI.Components.ToolChoiceMCP.t())
            | nil,
          tools:
            list(ExOpenAI.Components.RealtimeFunctionTool.t() | ExOpenAI.Components.MCPTool.t())
            | nil
        }
  defstruct [
    :audio,
    :conversation,
    :input,
    :instructions,
    :max_output_tokens,
    :metadata,
    :output_modalities,
    :prompt,
    :tool_choice,
    :tools
  ]
end
