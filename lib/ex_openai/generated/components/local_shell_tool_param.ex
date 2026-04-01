defmodule ExOpenAI.Components.LocalShellToolParam do
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
  defstruct [:type]
end
