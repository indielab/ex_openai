defmodule ExOpenAI.Components.ChatSessionAutomaticThreadTitling do
  use ExOpenAI.Jason

  @moduledoc """
  Automatic thread title preferences for the session.

  ## Fields

  * `:enabled` - **required** - `boolean()`  
    Whether automatic thread titling is enabled.
  """
  @type t() :: %{__struct__: __MODULE__, enabled: boolean()}
  defstruct [:enabled]
end
