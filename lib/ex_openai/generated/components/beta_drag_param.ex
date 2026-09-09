defmodule ExOpenAI.Components.BetaDragParam do
  use ExOpenAI.Jason

  @moduledoc """
  A drag action.

  ## Fields

  * `:keys` - **optional** - `list(String.t()) | nil`

  * `:path` - **required** - `list(ExOpenAI.Components.BetaCoordParam.t())`
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
          keys: (list(String.t()) | nil) | nil,
          path: list(ExOpenAI.Components.BetaCoordParam.t()),
          type: :drag
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:keys) => list(String.t()) | nil,
              required(:path) => list(ExOpenAI.Components.BetaCoordParam.input()),
              required(:type) => :drag | String.t()
            }
  defstruct [:keys, :path, :type]
end
