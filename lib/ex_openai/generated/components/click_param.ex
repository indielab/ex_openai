defmodule ExOpenAI.Components.ClickParam do
  use ExOpenAI.Jason

  @moduledoc """
  A click action.

  ## Fields

  * `:button` - **required** - `ExOpenAI.Components.ClickButtonType.t()`  
    Indicates which mouse button was pressed during the click. One of `left`, `right`, `wheel`, `back`, or `forward`.

  * `:keys` - **optional** - `[String.t()] | any()`

  * `:type` - **required** - `:click`  
    Specifies the event type. For a click action, this property is always `click`.  
    Allowed values: `"click"`  
    Default: `"click"`

  * `:x` - **required** - `integer()`  
    The x-coordinate where the click occurred.

  * `:y` - **required** - `integer()`  
    The y-coordinate where the click occurred.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          button: ExOpenAI.Components.ClickButtonType.t(),
          keys: (list(String.t()) | any()) | nil,
          type: :click,
          x: integer(),
          y: integer()
        }
  defstruct [:button, :keys, :type, :x, :y]
end
