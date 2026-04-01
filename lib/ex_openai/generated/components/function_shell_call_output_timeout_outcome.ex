defmodule ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcome do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that the shell call exceeded its configured time limit.

  ## Fields

  * `:type` - **required** - `:timeout`  
    The outcome type. Always `timeout`.  
    Allowed values: `"timeout"`  
    Default: `"timeout"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :timeout}
  defstruct [:type]
end
