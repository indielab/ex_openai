defmodule ExOpenAI.Components.BetaCoordParam do
  use ExOpenAI.Jason

  @moduledoc """
  An x/y coordinate pair, e.g. `{ x: 100, y: 200 }`.

  ## Fields

  * `:x` - **required** - `integer()`
    The x-coordinate.

  * `:y` - **required** - `integer()`
    The y-coordinate.
  """
  @type t() :: %{__struct__: __MODULE__, x: integer(), y: integer()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:x) => integer(), required(:y) => integer()}
  defstruct [:x, :y]
end
