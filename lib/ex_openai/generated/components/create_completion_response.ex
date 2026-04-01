defmodule ExOpenAI.Components.CreateCompletionResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Represents a completion response from the API. Note: both the streamed and non-streamed response objects share the same shape (unlike the chat endpoint).


  ## Fields

  * `:choices` - **required** - `[{:%{}, [], [{{:required, [], [:finish_reason]}, {:|, [], [{:|, [], [:stop, :length]}, :content_filter]}}, {{:required, [], [:index]}, {:integer, [], []}}, {{:required, [], [:logprobs]}, {:|, [], [{:%{}, [], [{{:optional, [], [:text_offset]}, {:list, [], [{:integer, [], []}]}}, {{:optional, [], [:token_logprobs]}, {:list, [], [{:number, [], []}]}}, {{:optional, [], [:tokens]}, {:list, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}]}}, {{:optional, [], [:top_logprobs]}, {:list, [], [{:map, [], []}]}}]}, {:any, [], []}]}}, {{:required, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    The list of completion choices the model generated for the input prompt.

  * `:created` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the completion was created.

  * `:id` - **required** - `String.t()`  
    A unique identifier for the completion.

  * `:model` - **required** - `String.t()`  
    The model used for completion.

  * `:object` - **required** - `:text_completion`  
    The object type, which is always "text_completion"  
    Allowed values: `"text_completion"`

  * `:system_fingerprint` - **optional** - `String.t()`  
    This fingerprint represents the backend configuration that the model runs with.

  Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.

  * `:usage` - **optional** - `ExOpenAI.Components.CompletionUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          choices:
            list(%{
              required(:finish_reason) => (:stop | :length) | :content_filter,
              required(:index) => integer(),
              required(:logprobs) =>
                %{
                  optional(:text_offset) => list(integer()),
                  optional(:token_logprobs) => list(number()),
                  optional(:tokens) => list(String.t()),
                  optional(:top_logprobs) => list(map())
                }
                | any(),
              required(:text) => String.t()
            }),
          created: integer(),
          id: String.t(),
          model: String.t(),
          object: :text_completion,
          system_fingerprint: String.t() | nil,
          usage: ExOpenAI.Components.CompletionUsage.t() | nil
        }
  defstruct [:choices, :created, :id, :model, :object, :system_fingerprint, :usage]
end
