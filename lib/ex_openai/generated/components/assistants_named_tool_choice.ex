defmodule ExOpenAI.Components.AssistantsNamedToolChoice do
  use ExOpenAI.Jason

  @moduledoc """
  Specifies a tool the model should use. Use to force the model to call a specific tool.

  ## Fields

  * `:function` - **optional** - `{:%{}, [], [{{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:type` - **required** - `:function | :code_interpreter | :file_search`  
    The type of the tool. If type is `function`, the function name must be set  
    Allowed values: `"function"`, `"code_interpreter"`, `"file_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{required(:name) => String.t()} | nil,
          type: (:function | :code_interpreter) | :file_search
        }
  defstruct [:function, :type]
end
