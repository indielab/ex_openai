defmodule ExOpenAI.Components.GroupUserDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after removing a user from a group.

  ## Fields

  * `:deleted` - **required** - `boolean()`  
    Whether the group membership was removed.

  * `:object` - **required** - `:"group.user.deleted"`  
    Always `group.user.deleted`.  
    Allowed values: `"group.user.deleted"`
  """
  @type t() :: %{__struct__: __MODULE__, deleted: boolean(), object: :"group.user.deleted"}
  defstruct [:deleted, :object]
end
