defmodule ExOpenAI.Components.BetaDoubleClickAction do
  use ExOpenAI.Jason

  @moduledoc """
  A double click action.

  ## Fields

  * `:keys` - **required** - `list(String.t()) | nil`

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
          keys: list(String.t()) | nil,
          type: :double_click,
          x: integer(),
          y: integer()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:keys) => list(String.t()) | nil,
              required(:type) => :double_click | String.t(),
              required(:x) => integer(),
              required(:y) => integer()
            }
  defstruct [:keys, :type, :x, :y]
end
