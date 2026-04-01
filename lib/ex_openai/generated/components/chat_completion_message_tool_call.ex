defmodule ExOpenAI.Components.ChatCompletionMessageToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  A call to a function tool created by the model.


  ## Fields

  * `:function` - **required** - `{:%{}, [], [{{:required, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    The function that the model called.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call.

  * `:type` - **required** - `:function`  
    The type of the tool. Currently, only `function` is supported.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{required(:arguments) => String.t(), required(:name) => String.t()},
          id: String.t(),
          type: :function
        }
  defstruct [:function, :id, :type]
end
