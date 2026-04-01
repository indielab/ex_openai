defmodule ExOpenAI.Components.FunctionToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FunctionToolParam.

  ## Fields

  * `:defer_loading` - **optional** - `boolean()`  
    Whether this function should be deferred and discovered via tool search.

  * `:description` - **optional** - `String.t() | any()`

  * `:name` - **required** - `String.t()`  
    Constraints: minLength: 1, maxLength: 128, pattern: "^[a-zA-Z0-9_-]+$"

  * `:parameters` - **optional** - `ExOpenAI.Components.EmptyModelParam.t() | any()`

  * `:strict` - **optional** - `boolean() | any()`

  * `:type` - **required** - `:function`  
    Allowed values: `"function"`  
    Default: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          defer_loading: boolean() | nil,
          description: (String.t() | any()) | nil,
          name: String.t(),
          parameters: (ExOpenAI.Components.EmptyModelParam.t() | any()) | nil,
          strict: (boolean() | any()) | nil,
          type: :function
        }
  defstruct [:defer_loading, :description, :name, :parameters, :strict, :type]
end
