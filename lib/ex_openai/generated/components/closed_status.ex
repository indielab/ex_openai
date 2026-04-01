defmodule ExOpenAI.Components.ClosedStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that a thread has been closed.

  ## Fields

  * `:reason` - **required** - `String.t() | any()`

  * `:type` - **required** - `:closed`  
    Status discriminator that is always `closed`.  
    Allowed values: `"closed"`  
    Default: `"closed"`
  """
  @type t() :: %{__struct__: __MODULE__, reason: String.t() | any(), type: :closed}
  defstruct [:reason, :type]
end
