defmodule ExOpenAI.Components.FineTuneChatCompletionRequestAssistantMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FineTuneChatCompletionRequestAssistantMessage.

  ## Fields

  * `:audio` - **optional** - `%{required(:id) => String.t()} | nil`

  * `:content` - **optional** - `String.t() | list(ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart.t()) | nil`

  * `:function_call` - **optional** - `%{required(:arguments) => String.t(), required(:name) => String.t()} | nil`

  * `:name` - **optional** - `String.t()`
    An optional name for the participant. Provides the model information to differentiate between participants of the same role.

  * `:refusal` - **optional** - `String.t() | nil`

  * `:role` - **required** - `:assistant`
    The role of the messages author, in this case `assistant`.
    Allowed values: `"assistant"`

  * `:tool_calls` - **optional** - `ExOpenAI.Components.ChatCompletionMessageToolCalls.t()`

  * `:weight` - **optional** - `integer()`
    Controls whether the assistant message is trained against (0 or 1)
    Allowed values: `0`, `1`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio: (%{required(:id) => String.t()} | nil) | nil,
          content:
            ((String.t()
              | list(ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart.t()))
             | nil)
            | nil,
          function_call:
            (%{required(:arguments) => String.t(), required(:name) => String.t()} | nil) | nil,
          name: String.t() | nil,
          refusal: (String.t() | nil) | nil,
          role: :assistant,
          tool_calls: ExOpenAI.Components.ChatCompletionMessageToolCalls.t() | nil,
          weight: integer() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:audio) => %{required(:id) => String.t()} | nil,
              optional(:content) =>
                (String.t()
                 | list(
                     ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart.input()
                   ))
                | nil,
              optional(:function_call) =>
                %{required(:arguments) => String.t(), required(:name) => String.t()} | nil,
              optional(:name) => String.t(),
              optional(:refusal) => String.t() | nil,
              required(:role) => :assistant | String.t(),
              optional(:tool_calls) => ExOpenAI.Components.ChatCompletionMessageToolCalls.input(),
              optional(:weight) => integer()
            }
  defstruct [:audio, :content, :function_call, :name, :refusal, :role, :tool_calls, :weight]
end
