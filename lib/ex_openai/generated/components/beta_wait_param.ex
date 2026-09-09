defmodule ExOpenAI.Components.BetaWaitParam do
  use ExOpenAI.Jason

  @moduledoc """
  A wait action.

  ## Fields

  * `:type` - **required** - `:wait`
    Specifies the event type. For a wait action, this property is always set to `wait`.
    Allowed values: `"wait"`
    Default: `"wait"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :wait}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :wait | String.t()}
  defstruct [:type]
end
