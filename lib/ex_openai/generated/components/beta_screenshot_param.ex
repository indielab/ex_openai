defmodule ExOpenAI.Components.BetaScreenshotParam do
  use ExOpenAI.Jason

  @moduledoc """
  A screenshot action.

  ## Fields

  * `:type` - **required** - `:screenshot`
    Specifies the event type. For a screenshot action, this property is always set to `screenshot`.
    Allowed values: `"screenshot"`
    Default: `"screenshot"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :screenshot}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :screenshot | String.t()}
  defstruct [:type]
end
