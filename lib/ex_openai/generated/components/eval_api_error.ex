defmodule ExOpenAI.Components.EvalApiError do
  use ExOpenAI.Jason

  @moduledoc """
  An object representing an error response from the Eval API.


  ## Fields

  * `:code` - **required** - `String.t()`  
    The error code.

  * `:message` - **required** - `String.t()`  
    The error message.
  """
  @type t() :: %{__struct__: __MODULE__, code: String.t(), message: String.t()}
  defstruct [:code, :message]
end
