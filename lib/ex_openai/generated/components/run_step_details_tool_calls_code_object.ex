defmodule ExOpenAI.Components.RunStepDetailsToolCallsCodeObject do
  use ExOpenAI.Jason

  @moduledoc """
  Details of the Code Interpreter tool call the run step was involved in.

  ## Fields

  * `:code_interpreter` - **required** - `{:%{}, [], [{{:required, [], [:input]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:outputs]}, {:list, [], [{:map, [], []}]}}]}`  
    The Code Interpreter tool call definition.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call.

  * `:type` - **required** - `:code_interpreter`  
    The type of tool call. This is always going to be `code_interpreter` for this type of tool call.  
    Allowed values: `"code_interpreter"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code_interpreter: %{required(:input) => String.t(), required(:outputs) => list(map())},
          id: String.t(),
          type: :code_interpreter
        }
  defstruct [:code_interpreter, :id, :type]
end
