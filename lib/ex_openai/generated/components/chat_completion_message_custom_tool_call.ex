defmodule ExOpenAI.Components.ChatCompletionMessageCustomToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  A call to a custom tool created by the model.


  ## Fields

  * `:custom` - **required** - `{:%{}, [], [{{:required, [], [:input]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    The custom tool that the model called.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call.

  * `:type` - **required** - `:custom`  
    The type of the tool. Always `custom`.  
    Allowed values: `"custom"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          custom: %{required(:input) => String.t(), required(:name) => String.t()},
          id: String.t(),
          type: :custom
        }
  defstruct [:custom, :id, :type]
end
