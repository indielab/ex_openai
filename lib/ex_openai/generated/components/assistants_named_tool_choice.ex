defmodule ExOpenAI.Components.AssistantsNamedToolChoice do
  use ExOpenAI.Jason

  @moduledoc """
  Specifies a tool the model should use. Use to force the model to call a specific tool.

  ## Fields

  * `:function` - **optional** - `%{required(:name) => String.t()}`

  * `:type` - **required** - `:function | :code_interpreter | :file_search`
    The type of the tool. If type is `function`, the function name must be set
    Allowed values: `"function"`, `"code_interpreter"`, `"file_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{required(:name) => String.t()} | nil,
          type: (:function | :code_interpreter) | :file_search
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:function) => %{required(:name) => String.t()},
              required(:type) => ((:function | :code_interpreter) | :file_search) | String.t()
            }
  defstruct [:function, :type]
end
