defmodule ExOpenAI.Components.CreateGroupUserBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for adding a user to a group.

  ## Fields

  * `:user_id` - **required** - `String.t()`  
    Identifier of the user to add to the group.
  """
  @type t() :: %{__struct__: __MODULE__, user_id: String.t()}
  defstruct [:user_id]
end
