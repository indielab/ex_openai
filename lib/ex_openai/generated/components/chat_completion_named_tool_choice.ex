defmodule ExOpenAI.Components.ChatCompletionNamedToolChoice do
  use ExOpenAI.Jason

  @moduledoc """
  Specifies a tool the model should use. Use to force the model to call a specific function.

  ## Fields

  * `:function` - **required** - `{:%{}, [], [{{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:function`  
    For function calling, the type is always `function`.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{required(:name) => String.t()},
          type: :function
        }
  defstruct [:function, :type]
end
