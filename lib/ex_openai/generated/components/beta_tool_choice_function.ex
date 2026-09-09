defmodule ExOpenAI.Components.BetaToolChoiceFunction do
  use ExOpenAI.Jason

  @moduledoc """
  Use this option to force the model to call a specific function.


  ## Fields

  * `:name` - **required** - `String.t()`
    The name of the function to call.

  * `:type` - **required** - `:function`
    For function calling, the type is always `function`.
    Allowed values: `"function"`
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t(), type: :function}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:name) => String.t(), required(:type) => :function | String.t()}
  defstruct [:name, :type]
end
