defmodule ExOpenAI.Components.ChatCompletionTool do
  use ExOpenAI.Jason

  @moduledoc """
  A function tool that can be used to generate a response.


  ## Fields

  * `:function` - **required** - `ExOpenAI.Components.FunctionObject.t()`

  * `:type` - **required** - `:function`  
    The type of the tool. Currently, only `function` is supported.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: ExOpenAI.Components.FunctionObject.t(),
          type: :function
        }
  defstruct [:function, :type]
end
