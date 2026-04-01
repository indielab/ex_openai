defmodule ExOpenAI.Components.ScrollParam do
  use ExOpenAI.Jason

  @moduledoc """
  A scroll action.

  ## Fields

  * `:keys` - **optional** - `[String.t()] | any()`

  * `:scroll_x` - **required** - `integer()`  
    The horizontal scroll distance.

  * `:scroll_y` - **required** - `integer()`  
    The vertical scroll distance.

  * `:type` - **required** - `:scroll`  
    Specifies the event type. For a scroll action, this property is always set to `scroll`.  
    Allowed values: `"scroll"`  
    Default: `"scroll"`

  * `:x` - **required** - `integer()`  
    The x-coordinate where the scroll occurred.

  * `:y` - **required** - `integer()`  
    The y-coordinate where the scroll occurred.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          keys: (list(String.t()) | any()) | nil,
          scroll_x: integer(),
          scroll_y: integer(),
          type: :scroll,
          x: integer(),
          y: integer()
        }
  defstruct [:keys, :scroll_x, :scroll_y, :type, :x, :y]
end
