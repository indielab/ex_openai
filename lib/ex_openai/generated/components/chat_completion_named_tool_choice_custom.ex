defmodule ExOpenAI.Components.ChatCompletionNamedToolChoiceCustom do
  use ExOpenAI.Jason

  @moduledoc """
  Specifies a tool the model should use. Use to force the model to call a specific custom tool.

  ## Fields

  * `:custom` - **required** - `{:%{}, [], [{{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:custom`  
    For custom tool calling, the type is always `custom`.  
    Allowed values: `"custom"`
  """
  @type t() :: %{__struct__: __MODULE__, custom: %{required(:name) => String.t()}, type: :custom}
  defstruct [:custom, :type]
end
