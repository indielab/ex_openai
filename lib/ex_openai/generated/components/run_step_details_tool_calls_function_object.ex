defmodule ExOpenAI.Components.RunStepDetailsToolCallsFunctionObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDetailsToolCallsFunctionObject.

  ## Fields

  * `:function` - **required** - `{:%{}, [], [{{:required, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:output]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}]}`  
    The definition of the function that was called.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call object.

  * `:type` - **required** - `:function`  
    The type of tool call. This is always going to be `function` for this type of tool call.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{
            required(:arguments) => String.t(),
            required(:name) => String.t(),
            required(:output) => String.t() | any()
          },
          id: String.t(),
          type: :function
        }
  defstruct [:function, :id, :type]
end
