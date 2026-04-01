defmodule ExOpenAI.Components.DoubleClickAction do
  use ExOpenAI.Jason

  @moduledoc """
  A double click action.

  ## Fields

  * `:keys` - **required** - `[String.t()] | any()`

  * `:type` - **required** - `:double_click`  
    Specifies the event type. For a double click action, this property is always set to `double_click`.  
    Allowed values: `"double_click"`  
    Default: `"double_click"`

  * `:x` - **required** - `integer()`  
    The x-coordinate where the double click occurred.

  * `:y` - **required** - `integer()`  
    The y-coordinate where the double click occurred.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          keys: list(String.t()) | any(),
          type: :double_click,
          x: integer(),
          y: integer()
        }
  defstruct [:keys, :type, :x, :y]
end
