defmodule ExOpenAI.Components.AutomaticThreadTitlingParam do
  use ExOpenAI.Jason

  @moduledoc """
  Controls whether ChatKit automatically generates thread titles.

  ## Fields

  * `:enabled` - **optional** - `boolean()`  
    Enable automatic thread title generation. Defaults to true.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean() | nil}
  defstruct [:enabled]
end
