defmodule ExOpenAI.Components.BetaSpecificFunctionShellParam do
  use ExOpenAI.Jason

  @moduledoc """
  Forces the model to call the shell tool when a tool call is required.

  ## Fields

  * `:type` - **required** - `:shell`
    The tool to call. Always `shell`.
    Allowed values: `"shell"`
    Default: `"shell"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :shell}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :shell | String.t()}
  defstruct [:type]
end
