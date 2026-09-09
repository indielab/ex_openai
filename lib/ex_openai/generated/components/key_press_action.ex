defmodule ExOpenAI.Components.KeyPressAction do
  use ExOpenAI.Jason

  @moduledoc """
  A collection of keypresses the model would like to perform.

  ## Fields

  * `:keys` - **required** - `list(String.t())`
    The combination of keys the model is requesting to be pressed. This is an array of strings, each representing a key.

  * `:type` - **required** - `:keypress`
    Specifies the event type. For a keypress action, this property is always set to `keypress`.
    Allowed values: `"keypress"`
    Default: `"keypress"`
  """
  @type t() :: %{__struct__: __MODULE__, keys: list(String.t()), type: :keypress}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:keys) => list(String.t()), required(:type) => :keypress | String.t()}
  defstruct [:keys, :type]
end
