defmodule ExOpenAI.Components.LockedStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Indicates that a thread is locked and cannot accept new input.

  ## Fields

  * `:reason` - **required** - `String.t() | any()`

  * `:type` - **required** - `:locked`  
    Status discriminator that is always `locked`.  
    Allowed values: `"locked"`  
    Default: `"locked"`
  """
  @type t() :: %{__struct__: __MODULE__, reason: String.t() | any(), type: :locked}
  defstruct [:reason, :type]
end
