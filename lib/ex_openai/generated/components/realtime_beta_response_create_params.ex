defmodule ExOpenAI.Components.RealtimeBetaResponseCreateParams do
  use ExOpenAI.Jason

  @moduledoc """
  Create a new Realtime response with these parameters

  ## Fields

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
  Note that this can include references to items from the default conversation.

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

  * `:metadata` - **optional** - `ExOpenAI.Components.Metadata.t()`

  * `:modalities` - **optional** - `list(:text | :audio)`
    The set of modalities the model can respond with. To disable audio,
  set this to ["text"].

  * `:output_audio_format` - **optional** - `:pcm16 | :g711_ulaw | :g711_alaw`
    The format of output audio. Options are `pcm16`, `g711_ulaw`, or `g711_alaw`.
    Allowed values: `"pcm16"`, `"g711_ulaw"`, `"g711_alaw"`

  * `:prompt` - **optional** - `ExOpenAI.Components.Prompt.t()`

  * `:temperature` - **optional** - `number()`
    Sampling temperature for the model, limited to [0.6, 1.2]. Defaults to 0.8.

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t()`
    How the model chooses tools. Provide one of the string modes or force a specific
  function/MCP tool.
    Default: `"auto"`

  * `:tools` - **optional** - `list(%{ optional(:description) => String.t(), optional(:name) => String.t(), optional(:parameters) => map(), optional(:type) => :function })`
    Tools (functions) available to the model.

  * `:voice` - **optional** - `ExOpenAI.Components.VoiceIdsOrCustomVoice.t()`
    The voice the model uses to respond. Supported built-in voices are
  `alloy`, `ash`, `ballad`, `coral`, `echo`, `sage`, `shimmer`, `verse`,
  `marin`, and `cedar`. You may also provide a custom voice object with an
  `id`, for example `{ "id": "voice_1234" }`. Voice cannot be changed during
  the session once the model has responded with audio at least once.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          conversation: (String.t() | :auto | :none) | nil,
          input: list(ExOpenAI.Components.RealtimeConversationItem.t()) | nil,
          instructions: String.t() | nil,
          max_output_tokens: (integer() | :inf) | nil,
          metadata: ExOpenAI.Components.Metadata.t() | nil,
          modalities: list(:text | :audio) | nil,
          output_audio_format: ((:pcm16 | :g711_ulaw) | :g711_alaw) | nil,
          prompt: ExOpenAI.Components.Prompt.t() | nil,
          temperature: number() | nil,
          tool_choice:
            ((ExOpenAI.Components.ToolChoiceOptions.t()
              | ExOpenAI.Components.ToolChoiceFunction.t())
             | ExOpenAI.Components.ToolChoiceMCP.t())
            | nil,
          tools:
            list(%{
              optional(:description) => String.t(),
              optional(:name) => String.t(),
              optional(:parameters) => map(),
              optional(:type) => :function
            })
            | nil,
          voice: ExOpenAI.Components.VoiceIdsOrCustomVoice.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:conversation) => String.t() | (:auto | :none) | String.t(),
              optional(:input) => list(ExOpenAI.Components.RealtimeConversationItem.input()),
              optional(:instructions) => String.t(),
              optional(:max_output_tokens) => integer() | :inf | String.t(),
              optional(:metadata) => ExOpenAI.Components.Metadata.input(),
              optional(:modalities) => list((:text | :audio) | String.t()),
              optional(:output_audio_format) => ((:pcm16 | :g711_ulaw) | :g711_alaw) | String.t(),
              optional(:prompt) => ExOpenAI.Components.Prompt.input(),
              optional(:temperature) => number(),
              optional(:tool_choice) =>
                (ExOpenAI.Components.ToolChoiceOptions.input()
                 | ExOpenAI.Components.ToolChoiceFunction.input())
                | ExOpenAI.Components.ToolChoiceMCP.input(),
              optional(:tools) =>
                list(%{
                  optional(:description) => String.t(),
                  optional(:name) => String.t(),
                  optional(:parameters) => map(),
                  optional(:type) => :function | String.t()
                }),
              optional(:voice) => ExOpenAI.Components.VoiceIdsOrCustomVoice.input()
            }
  defstruct [
    :conversation,
    :input,
    :instructions,
    :max_output_tokens,
    :metadata,
    :modalities,
    :output_audio_format,
    :prompt,
    :temperature,
    :tool_choice,
    :tools,
    :voice
  ]
end
