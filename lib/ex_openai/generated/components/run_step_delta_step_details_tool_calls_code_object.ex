defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsCodeObject do
  use ExOpenAI.Jason

  @moduledoc """
  Details of the Code Interpreter tool call the run step was involved in.

  ## Fields

  * `:code_interpreter` - **optional** - `{:%{}, [], [{{:optional, [], [:input]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:outputs]}, {:list, [], [{:map, [], []}]}}]}`  
    The Code Interpreter tool call definition.

  * `:id` - **optional** - `String.t()`  
    The ID of the tool call.

  * `:index` - **required** - `integer()`  
    The index of the tool call in the tool calls array.

  * `:type` - **required** - `:code_interpreter`  
    The type of tool call. This is always going to be `code_interpreter` for this type of tool call.  
    Allowed values: `"code_interpreter"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code_interpreter:
            %{optional(:input) => String.t(), optional(:outputs) => list(map())} | nil,
          id: String.t() | nil,
          index: integer(),
          type: :code_interpreter
        }
  defstruct [:code_interpreter, :id, :index, :type]
end
