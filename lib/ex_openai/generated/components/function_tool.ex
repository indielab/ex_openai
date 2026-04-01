defmodule ExOpenAI.Components.FunctionTool do
  use ExOpenAI.Jason

  @moduledoc """
  Defines a function in your own code the model can choose to call. Learn more about [function calling](https://platform.openai.com/docs/guides/function-calling).

  ## Fields

  * `:defer_loading` - **optional** - `boolean()`  
    Whether this function is deferred and loaded via tool search.

  * `:description` - **optional** - `String.t() | any()`

  * `:name` - **required** - `String.t()`  
    The name of the function to call.

  * `:parameters` - **required** - `map() | any()`

  * `:strict` - **required** - `boolean() | any()`

  * `:type` - **required** - `:function`  
    The type of the function tool. Always `function`.  
    Allowed values: `"function"`  
    Default: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          defer_loading: boolean() | nil,
          description: (String.t() | any()) | nil,
          name: String.t(),
          parameters: map() | any(),
          strict: boolean() | any(),
          type: :function
        }
  defstruct [:defer_loading, :description, :name, :parameters, :strict, :type]
end
