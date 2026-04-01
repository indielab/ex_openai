defmodule ExOpenAI.Components.WaitParam do
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
  defstruct [:type]
end
