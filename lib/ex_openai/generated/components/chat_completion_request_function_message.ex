defmodule ExOpenAI.Components.ChatCompletionRequestFunctionMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestFunctionMessage.

  ## Fields

  * `:content` - **required** - `String.t() | any()`

  * `:name` - **required** - `String.t()`  
    The name of the function to call.

  * `:role` - **required** - `:function`  
    The role of the messages author, in this case `function`.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content: String.t() | any(),
          name: String.t(),
          role: :function
        }
  defstruct [:content, :name, :role]
end
