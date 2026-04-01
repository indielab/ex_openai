defmodule ExOpenAI.Components.CreateChatCompletionResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a chat completion response returned by model, based on the provided input.

  ## Fields

  * `:choices` - **required** - `[{:%{}, [], [{{:required, [], [:finish_reason]}, {:|, [], [{:|, [], [{:|, [], [{:|, [], [:stop, :length]}, :tool_calls]}, :content_filter]}, :function_call]}}, {{:required, [], [:index]}, {:integer, [], []}}, {{:required, [], [:logprobs]}, {:|, [], [{:%{}, [], [{{:required, [], [:content]}, {:|, [], [{:list, [], [{{:., [], [ExOpenAI.Components.ChatCompletionTokenLogprob, :t]}, [], []}]}, {:any, [], []}]}}, {{:required, [], [:refusal]}, {:|, [], [{:list, [], [{{:., [], [ExOpenAI.Components.ChatCompletionTokenLogprob, :t]}, [], []}]}, {:any, [], []}]}}]}, {:any, [], []}]}}, {{:required, [], [:message]}, {{:., [], [ExOpenAI.Components.ChatCompletionResponseMessage, :t]}, [], []}}]}]`  
    A list of chat completion choices. Can be more than one if `n` is greater than 1.

  * `:created` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the chat completion was created.

  * `:id` - **required** - `String.t()`  
    A unique identifier for the chat completion.

  * `:model` - **required** - `String.t()`  
    The model used for the chat completion.

  * `:object` - **required** - `:"chat.completion"`  
    The object type, which is always `chat.completion`.  
    Allowed values: `"chat.completion"`

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:system_fingerprint` - **optional** - `String.t()`  
    This fingerprint represents the backend configuration that the model runs with.

  Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.

  * `:usage` - **optional** - `ExOpenAI.Components.CompletionUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          choices:
            list(%{
              required(:finish_reason) =>
                (((:stop | :length) | :tool_calls) | :content_filter) | :function_call,
              required(:index) => integer(),
              required(:logprobs) =>
                %{
                  required(:content) =>
                    list(ExOpenAI.Components.ChatCompletionTokenLogprob.t()) | any(),
                  required(:refusal) =>
                    list(ExOpenAI.Components.ChatCompletionTokenLogprob.t()) | any()
                }
                | any(),
              required(:message) => ExOpenAI.Components.ChatCompletionResponseMessage.t()
            }),
          created: integer(),
          id: String.t(),
          model: String.t(),
          object: :"chat.completion",
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          system_fingerprint: String.t() | nil,
          usage: ExOpenAI.Components.CompletionUsage.t() | nil
        }
  defstruct [:choices, :created, :id, :model, :object, :service_tier, :system_fingerprint, :usage]
end
