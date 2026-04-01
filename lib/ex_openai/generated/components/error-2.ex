defmodule :"Elixir.ExOpenAI.Components.Error-2" do
  use ExOpenAI.Jason

  @moduledoc """
  An error that occurred while generating the response.

  ## Fields

  * `:code` - **required** - `String.t()`  
    A machine-readable error code that was returned.

  * `:message` - **required** - `String.t()`  
    A human-readable description of the error that was returned.
  """
  @type t() :: %{__struct__: __MODULE__, code: String.t(), message: String.t()}
  defstruct [:code, :message]
end
