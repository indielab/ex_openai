defmodule ExOpenAI.Components.RunStepDeltaStepDetailsToolCallsFunctionObject do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RunStepDeltaStepDetailsToolCallsFunctionObject.

  ## Fields

  * `:function` - **optional** - `{:%{}, [], [{{:optional, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:output]}, {:|, [], [{{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}, {:any, [], []}]}}]}`  
    The definition of the function that was called.

  * `:id` - **optional** - `String.t()`  
    The ID of the tool call object.

  * `:index` - **required** - `integer()`  
    The index of the tool call in the tool calls array.

  * `:type` - **required** - `:function`  
    The type of tool call. This is always going to be `function` for this type of tool call.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function:
            %{
              optional(:arguments) => String.t(),
              optional(:name) => String.t(),
              optional(:output) => String.t() | any()
            }
            | nil,
          id: String.t() | nil,
          index: integer(),
          type: :function
        }
  defstruct [:function, :id, :index, :type]
end
