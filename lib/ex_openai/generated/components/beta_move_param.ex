defmodule ExOpenAI.Components.BetaMoveParam do
  use ExOpenAI.Jason

  @moduledoc """
  A mouse move action.

  ## Fields

  * `:keys` - **optional** - `list(String.t()) | nil`

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
          keys: (list(String.t()) | nil) | nil,
          type: :move,
          x: integer(),
          y: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:keys) => list(String.t()) | nil,
              required(:type) => :move | String.t(),
              required(:x) => integer(),
              required(:y) => integer()
            }
  defstruct [:keys, :type, :x, :y]
end
