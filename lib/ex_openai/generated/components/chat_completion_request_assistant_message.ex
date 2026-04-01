defmodule ExOpenAI.Components.ChatCompletionRequestAssistantMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Messages sent by the model in response to user messages.


  ## Fields

  * `:audio` - **optional** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`

  * `:content` - **optional** - `String.t() | [ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart.t()] | any()`

  * `:function_call` - **optional** - `{:%{}, [], [{{:required, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]} | any()`

  * `:name` - **optional** - `String.t()`  
    An optional name for the participant. Provides the model information to differentiate between participants of the same role.

  * `:refusal` - **optional** - `String.t() | any()`

  * `:role` - **required** - `:assistant`  
    The role of the messages author, in this case `assistant`.  
    Allowed values: `"assistant"`

  * `:tool_calls` - **optional** - `ExOpenAI.Components.ChatCompletionMessageToolCalls.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          audio: (%{required(:id) => String.t()} | any()) | nil,
          content:
            ((String.t()
              | list(ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart.t()))
             | any())
            | nil,
          function_call:
            (%{required(:arguments) => String.t(), required(:name) => String.t()} | any()) | nil,
          name: String.t() | nil,
          refusal: (String.t() | any()) | nil,
          role: :assistant,
          tool_calls: ExOpenAI.Components.ChatCompletionMessageToolCalls.t() | nil
        }
  defstruct [:audio, :content, :function_call, :name, :refusal, :role, :tool_calls]
end
