defmodule ExOpenAI.Components.ChatCompletionMessageList do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing a list of chat completion messages.


  ## Fields

  * `:data` - **required** - `[{:%{}, [], [{{:optional, [], [:annotations]}, {:list, [], [{:%{}, [], [{{:required, [], [:type]}, :url_citation}, {{:required, [], [:url_citation]}, {:%{}, [], [{{:required, [], [:end_index]}, {:integer, [], []}}, {{:required, [], [:start_index]}, {:integer, [], []}}, {{:required, [], [:title]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:url]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}}]}]}}, {{:optional, [], [:audio]}, {:|, [], [{:%{}, [], [{{:required, [], [:data]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:expires_at]}, {:integer, [], []}}, {{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:transcript]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}, {:any, [], []}]}}, {{:required, [], [:content]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:optional, [], [:content_parts]}, {:|, [], [{:list, [], [{:|, [], [{{:., [], [ExOpenAI.Components.ChatCompletionRequestMessageContentPartText, :t]}, [], []}, {{:., [], [ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage, :t]}, [], []}]}]}, {:any, [], []}]}}, {{:optional, [], [:function_call]}, {:%{}, [], [{{:required, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}}, {{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:refusal]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}, {{:required, [], [:role]}, :assistant}, {{:optional, [], [:tool_calls]}, {{:., [], [ExOpenAI.Components.ChatCompletionMessageToolCalls, :t]}, [], []}}]}]`  
    An array of chat completion message objects.

  * `:first_id` - **required** - `String.t()`  
    The identifier of the first chat message in the data array.

  * `:has_more` - **required** - `boolean()`  
    Indicates whether there are more chat messages available.

  * `:last_id` - **required** - `String.t()`  
    The identifier of the last chat message in the data array.

  * `:object` - **required** - `:list`  
    The type of this object. It is always set to "list".  
    Allowed values: `"list"`  
    Default: `"list"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data:
            list(%{
              optional(:annotations) =>
                list(%{
                  required(:type) => :url_citation,
                  required(:url_citation) => %{
                    required(:end_index) => integer(),
                    required(:start_index) => integer(),
                    required(:title) => String.t(),
                    required(:url) => String.t()
                  }
                }),
              optional(:audio) =>
                %{
                  required(:data) => String.t(),
                  required(:expires_at) => integer(),
                  required(:id) => String.t(),
                  required(:transcript) => String.t()
                }
                | any(),
              required(:content) => String.t() | any(),
              optional(:content_parts) =>
                list(
                  ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()
                  | ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage.t()
                )
                | any(),
              optional(:function_call) => %{
                required(:arguments) => String.t(),
                required(:name) => String.t()
              },
              required(:id) => String.t(),
              required(:refusal) => String.t() | any(),
              required(:role) => :assistant,
              optional(:tool_calls) => ExOpenAI.Components.ChatCompletionMessageToolCalls.t()
            }),
          first_id: String.t(),
          has_more: boolean(),
          last_id: String.t(),
          object: :list
        }
  defstruct [:data, :first_id, :has_more, :last_id, :object]
end
