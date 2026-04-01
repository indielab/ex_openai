defmodule ExOpenAI.Components.RunToolCallObject do
  use ExOpenAI.Jason

  @moduledoc """
  Tool call objects

  ## Fields

  * `:function` - **required** - `{:%{}, [], [{{:required, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    The function definition.

  * `:id` - **required** - `String.t()`  
    The ID of the tool call. This ID must be referenced when you submit the tool outputs in using the [Submit tool outputs to run](/docs/api-reference/runs/submitToolOutputs) endpoint.

  * `:type` - **required** - `:function`  
    The type of tool call the output is required for. For now, this is always `function`.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{required(:arguments) => String.t(), required(:name) => String.t()},
          id: String.t(),
          type: :function
        }
  defstruct [:function, :id, :type]
end
