defmodule ExOpenAI.Components.TokenCountsBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TokenCountsBody.

  ## Fields

  * `:conversation` - **optional** - `ExOpenAI.Components.ConversationParam.t() | nil`

  * `:input` - **optional** - `String.t() | list(ExOpenAI.Components.InputItem.t()) | nil`

  * `:instructions` - **optional** - `String.t() | nil`

  * `:model` - **optional** - `String.t() | nil`

  * `:parallel_tool_calls` - **optional** - `boolean() | nil`

  * `:personality` - **optional** - `ExOpenAI.Components.PersonalityEnum.t()`
    A model-owned style preset to apply to this request. Omit this parameter to use the model's default style. Supported values may expand over time. Values must be at most 64 characters.

  * `:previous_response_id` - **optional** - `String.t() | nil`

  * `:reasoning` - **optional** - `ExOpenAI.Components.Reasoning.t() | nil`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t() | nil`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t() | nil`

  * `:tools` - **optional** - `list(ExOpenAI.Components.Tool.t()) | nil`

  * `:truncation` - **optional** - `ExOpenAI.Components.TruncationEnum.t()`
    The truncation strategy to use for the model response. - `auto`: If the input to this Response exceeds the model's context window size, the model will truncate the response to fit the context window by dropping items from the beginning of the conversation. - `disabled` (default): If the input size will exceed the context window size for a model, the request will fail with a 400 error.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          conversation: (ExOpenAI.Components.ConversationParam.t() | nil) | nil,
          input: ((String.t() | list(ExOpenAI.Components.InputItem.t())) | nil) | nil,
          instructions: (String.t() | nil) | nil,
          model: (String.t() | nil) | nil,
          parallel_tool_calls: (boolean() | nil) | nil,
          personality: ExOpenAI.Components.PersonalityEnum.t() | nil,
          previous_response_id: (String.t() | nil) | nil,
          reasoning: (ExOpenAI.Components.Reasoning.t() | nil) | nil,
          text: (ExOpenAI.Components.ResponseTextParam.t() | nil) | nil,
          tool_choice: (ExOpenAI.Components.ToolChoiceParam.t() | nil) | nil,
          tools: (list(ExOpenAI.Components.Tool.t()) | nil) | nil,
          truncation: ExOpenAI.Components.TruncationEnum.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:conversation) => ExOpenAI.Components.ConversationParam.input() | nil,
              optional(:input) =>
                (String.t() | list(ExOpenAI.Components.InputItem.input())) | nil,
              optional(:instructions) => String.t() | nil,
              optional(:model) => String.t() | nil,
              optional(:parallel_tool_calls) => boolean() | nil,
              optional(:personality) => ExOpenAI.Components.PersonalityEnum.input(),
              optional(:previous_response_id) => String.t() | nil,
              optional(:reasoning) => ExOpenAI.Components.Reasoning.input() | nil,
              optional(:text) => ExOpenAI.Components.ResponseTextParam.input() | nil,
              optional(:tool_choice) => ExOpenAI.Components.ToolChoiceParam.input() | nil,
              optional(:tools) => list(ExOpenAI.Components.Tool.input()) | nil,
              optional(:truncation) => ExOpenAI.Components.TruncationEnum.input()
            }
  defstruct [
    :conversation,
    :input,
    :instructions,
    :model,
    :parallel_tool_calls,
    :personality,
    :previous_response_id,
    :reasoning,
    :text,
    :tool_choice,
    :tools,
    :truncation
  ]
end
