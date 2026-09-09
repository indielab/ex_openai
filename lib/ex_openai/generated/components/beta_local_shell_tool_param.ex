defmodule ExOpenAI.Components.BetaLocalShellToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that allows the model to execute shell commands in a local environment.

  ## Fields

  * `:type` - **required** - `:local_shell`
    The type of the local shell tool. Always `local_shell`.
    Allowed values: `"local_shell"`
    Default: `"local_shell"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :local_shell}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :local_shell | String.t()}
  defstruct [:type]
end
