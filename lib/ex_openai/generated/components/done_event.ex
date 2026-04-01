defmodule ExOpenAI.Components.DoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Occurs when a stream ends.

  ## Fields

  * `:data` - **required** - `:"[DONE]"`  
    Allowed values: `"[DONE]"`

  * `:event` - **required** - `:done`  
    Allowed values: `"done"`
  """
  @type t() :: %{__struct__: __MODULE__, data: :"[DONE]", event: :done}
  defstruct [:data, :event]
end
