defmodule ExOpenAI.Components.ComputerCallSafetyCheckParam do
  use ExOpenAI.Jason

  @moduledoc """
  A pending safety check for the computer call.

  ## Fields

  * `:code` - **optional** - `String.t() | any()`

  * `:id` - **required** - `String.t()`  
    The ID of the pending safety check.

  * `:message` - **optional** - `String.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: (String.t() | any()) | nil,
          id: String.t(),
          message: (String.t() | any()) | nil
        }
  defstruct [:code, :id, :message]
end
