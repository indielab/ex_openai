defmodule ExOpenAI.Components.InviteProjectGroupBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for granting a group access to a project.

  ## Fields

  * `:group_id` - **required** - `String.t()`  
    Identifier of the group to add to the project.

  * `:role` - **required** - `String.t()`  
    Identifier of the project role to grant to the group.
  """
  @type t() :: %{__struct__: __MODULE__, group_id: String.t(), role: String.t()}
  defstruct [:group_id, :role]
end
