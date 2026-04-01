defmodule ExOpenAI.Components.SpecificFunctionShellParam do
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
  defstruct [:type]
end
