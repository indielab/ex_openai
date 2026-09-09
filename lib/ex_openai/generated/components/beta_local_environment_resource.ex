defmodule ExOpenAI.Components.BetaLocalEnvironmentResource do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the use of a local environment to perform shell actions.

  ## Fields

  * `:type` - **required** - `:local`
    The environment type. Always `local`.
    Allowed values: `"local"`
    Default: `"local"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :local}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :local | String.t()}
  defstruct [:type]
end
