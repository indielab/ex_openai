defmodule ExOpenAI.Components.TokenCountsBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema TokenCountsBody.

  ## Fields

  * `:conversation` - **optional** - `ExOpenAI.Components.ConversationParam.t() | any()`

  * `:input` - **optional** - `String.t() | [ExOpenAI.Components.InputItem.t()] | any()`

  * `:instructions` - **optional** - `String.t() | any()`

  * `:model` - **optional** - `String.t() | any()`

  * `:parallel_tool_calls` - **optional** - `boolean() | any()`

  * `:previous_response_id` - **optional** - `String.t() | any()`

  * `:reasoning` - **optional** - `ExOpenAI.Components.Reasoning.t() | any()`

  * `:text` - **optional** - `ExOpenAI.Components.ResponseTextParam.t() | any()`

  * `:tool_choice` - **optional** - `ExOpenAI.Components.ToolChoiceParam.t() | any()`

  * `:tools` - **optional** - `[ExOpenAI.Components.Tool.t()] | any()`

  * `:truncation` - **optional** - `ExOpenAI.Components.TruncationEnum.t()`  
    The truncation strategy to use for the model response. - `auto`: If the input to this Response exceeds the model's context window size, the model will truncate the response to fit the context window by dropping items from the beginning of the conversation. - `disabled` (default): If the input size will exceed the context window size for a model, the request will fail with a 400 error.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          conversation: (ExOpenAI.Components.ConversationParam.t() | any()) | nil,
          input: ((String.t() | list(ExOpenAI.Components.InputItem.t())) | any()) | nil,
          instructions: (String.t() | any()) | nil,
          model: (String.t() | any()) | nil,
          parallel_tool_calls: (boolean() | any()) | nil,
          previous_response_id: (String.t() | any()) | nil,
          reasoning: (ExOpenAI.Components.Reasoning.t() | any()) | nil,
          text: (ExOpenAI.Components.ResponseTextParam.t() | any()) | nil,
          tool_choice: (ExOpenAI.Components.ToolChoiceParam.t() | any()) | nil,
          tools: (list(ExOpenAI.Components.Tool.t()) | any()) | nil,
          truncation: ExOpenAI.Components.TruncationEnum.t() | nil
        }
  defstruct [
    :conversation,
    :input,
    :instructions,
    :model,
    :parallel_tool_calls,
    :previous_response_id,
    :reasoning,
    :text,
    :tool_choice,
    :tools,
    :truncation
  ]
end
