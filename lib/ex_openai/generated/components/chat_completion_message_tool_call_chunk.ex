defmodule ExOpenAI.Components.ChatCompletionMessageToolCallChunk do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionMessageToolCallChunk.

  ## Fields

  * `:function` - **optional** - `{:%{}, [], [{{:optional, [], [:arguments]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:id` - **optional** - `String.t()`  
    The ID of the tool call.

  * `:index` - **required** - `integer()`

  * `:type` - **optional** - `:function`  
    The type of the tool. Currently, only `function` is supported.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          function: %{optional(:arguments) => String.t(), optional(:name) => String.t()} | nil,
          id: String.t() | nil,
          index: integer(),
          type: :function | nil
        }
  defstruct [:function, :id, :index, :type]
end
