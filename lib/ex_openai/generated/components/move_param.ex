defmodule ExOpenAI.Components.MoveParam do
  use ExOpenAI.Jason

  @moduledoc """
  A mouse move action.

  ## Fields

  * `:keys` - **optional** - `[String.t()] | any()`

  * `:type` - **required** - `:move`  
    Specifies the event type. For a move action, this property is always set to `move`.  
    Allowed values: `"move"`  
    Default: `"move"`

  * `:x` - **required** - `integer()`  
    The x-coordinate to move to.

  * `:y` - **required** - `integer()`  
    The y-coordinate to move to.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          keys: (list(String.t()) | any()) | nil,
          type: :move,
          x: integer(),
          y: integer()
        }
  defstruct [:keys, :type, :x, :y]
end
