defmodule ExOpenAI.Components.ScrollParam do
  use ExOpenAI.Jason

  @moduledoc """
  A scroll action.

  ## Fields

  * `:keys` - **optional** - `list(String.t()) | nil`

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
          keys: (list(String.t()) | nil) | nil,
          scroll_x: integer(),
          scroll_y: integer(),
          type: :scroll,
          x: integer(),
          y: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:keys) => list(String.t()) | nil,
              required(:scroll_x) => integer(),
              required(:scroll_y) => integer(),
              required(:type) => :scroll | String.t(),
              required(:x) => integer(),
              required(:y) => integer()
            }
  defstruct [:keys, :scroll_x, :scroll_y, :type, :x, :y]
end
