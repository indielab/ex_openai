defmodule ExOpenAI.Components.ChatCompletionMessageToolCallChunk do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionMessageToolCallChunk.

  ## Fields

  * `:function` - **optional** - `%{optional(:arguments) => String.t(), optional(:name) => String.t()}`

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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:function) => %{
                optional(:arguments) => String.t(),
                optional(:name) => String.t()
              },
              optional(:id) => String.t(),
              required(:index) => integer(),
              optional(:type) => :function | String.t()
            }
  defstruct [:function, :id, :index, :type]
end
