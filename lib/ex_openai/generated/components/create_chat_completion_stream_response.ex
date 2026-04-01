defmodule ExOpenAI.Components.CreateChatCompletionStreamResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a streamed chunk of a chat completion response returned
  by the model, based on the provided input. 
  [Learn more](/docs/guides/streaming-responses).


  ## Fields

  * `:choices` - **required** - `[{:%{}, [], [{{:required, [], [:delta]}, {{:., [], [ExOpenAI.Components.ChatCompletionStreamResponseDelta, :t]}, [], []}}, {{:required, [], [:finish_reason]}, {:|, [], [{:|, [], [{:|, [], [{:|, [], [{:|, [], [:stop, :length]}, :tool_calls]}, :content_filter]}, :function_call]}, nil]}}, {{:required, [], [:index]}, {:integer, [], []}}, {{:optional, [], [:logprobs]}, {:|, [], [{:%{}, [], [{{:required, [], [:content]}, {:|, [], [{:list, [], [{{:., [], [ExOpenAI.Components.ChatCompletionTokenLogprob, :t]}, [], []}]}, nil]}}, {{:required, [], [:refusal]}, {:|, [], [{:list, [], [{{:., [], [ExOpenAI.Components.ChatCompletionTokenLogprob, :t]}, [], []}]}, nil]}}]}, nil]}}]}]`  
    A list of chat completion choices. Can contain more than one elements if `n` is greater than 1. Can also be empty for the
  last chunk if you set `stream_options: {"include_usage": true}`.

  * `:created` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the chat completion was created. Each chunk has the same timestamp.

  * `:id` - **required** - `String.t()`  
    A unique identifier for the chat completion. Each chunk has the same ID.

  * `:model` - **required** - `String.t()`  
    The model to generate the completion.

  * `:object` - **required** - `:"chat.completion.chunk"`  
    The object type, which is always `chat.completion.chunk`.  
    Allowed values: `"chat.completion.chunk"`

  * `:service_tier` - **optional** - `ExOpenAI.Components.ServiceTier.t()`

  * `:system_fingerprint` - **optional** - `String.t()`  
    This fingerprint represents the backend configuration that the model runs with.
  Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.

  * `:usage` - **optional** - `ExOpenAI.Components.CompletionUsage.t() | nil`  
    An optional field that will only be present when you set
  `stream_options: {"include_usage": true}` in your request. When present, it
  contains a null value **except for the last chunk** which contains the
  token usage statistics for the entire request.

  **NOTE:** If the stream is interrupted or cancelled, you may not
  receive the final usage chunk which contains the total token usage for
  the request.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          choices:
            list(%{
              required(:delta) => ExOpenAI.Components.ChatCompletionStreamResponseDelta.t(),
              required(:finish_reason) =>
                ((((:stop | :length) | :tool_calls) | :content_filter) | :function_call) | nil,
              required(:index) => integer(),
              optional(:logprobs) =>
                %{
                  required(:content) =>
                    list(ExOpenAI.Components.ChatCompletionTokenLogprob.t()) | nil,
                  required(:refusal) =>
                    list(ExOpenAI.Components.ChatCompletionTokenLogprob.t()) | nil
                }
                | nil
            }),
          created: integer(),
          id: String.t(),
          model: String.t(),
          object: :"chat.completion.chunk",
          service_tier: ExOpenAI.Components.ServiceTier.t() | nil,
          system_fingerprint: String.t() | nil,
          usage: ExOpenAI.Components.CompletionUsage.t() | nil
        }
  defstruct [:choices, :created, :id, :model, :object, :service_tier, :system_fingerprint, :usage]
end
