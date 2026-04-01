defmodule ExOpenAI.Components.GroupUserAssignment do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after adding a user to a group.

  ## Fields

  * `:group_id` - **required** - `String.t()`  
    Identifier of the group the user was added to.

  * `:object` - **required** - `:"group.user"`  
    Always `group.user`.  
    Allowed values: `"group.user"`

  * `:user_id` - **required** - `String.t()`  
    Identifier of the user that was added.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          group_id: String.t(),
          object: :"group.user",
          user_id: String.t()
        }
  defstruct [:group_id, :object, :user_id]
end
