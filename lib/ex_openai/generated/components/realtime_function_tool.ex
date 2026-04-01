defmodule ExOpenAI.Components.RealtimeFunctionTool do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RealtimeFunctionTool.

  ## Fields

  * `:description` - **optional** - `String.t()`  
    The description of the function, including guidance on when and how
  to call it, and guidance about what to tell the user when calling
  (if anything).

  * `:name` - **optional** - `String.t()`  
    The name of the function.

  * `:parameters` - **optional** - `map()`  
    Parameters of the function in JSON Schema.

  * `:type` - **optional** - `:function`  
    The type of the tool, i.e. `function`.  
    Allowed values: `"function"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t() | nil,
          name: String.t() | nil,
          parameters: map() | nil,
          type: :function | nil
        }
  defstruct [:description, :name, :parameters, :type]
end
