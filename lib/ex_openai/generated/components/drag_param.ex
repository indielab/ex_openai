defmodule ExOpenAI.Components.DragParam do
  use ExOpenAI.Jason

  @moduledoc """
  A drag action.

  ## Fields

  * `:keys` - **optional** - `[String.t()] | any()`

  * `:path` - **required** - `[ExOpenAI.Components.CoordParam.t()]`  
    An array of coordinates representing the path of the drag action. Coordinates will appear as an array of objects, eg
  ```
  [
    { x: 100, y: 200 },
    { x: 200, y: 300 }
  ]
  ```

  * `:type` - **required** - `:drag`  
    Specifies the event type. For a drag action, this property is always set to `drag`.  
    Allowed values: `"drag"`  
    Default: `"drag"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          keys: (list(String.t()) | any()) | nil,
          path: list(ExOpenAI.Components.CoordParam.t()),
          type: :drag
        }
  defstruct [:keys, :path, :type]
end
