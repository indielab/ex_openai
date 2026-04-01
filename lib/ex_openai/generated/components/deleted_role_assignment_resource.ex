defmodule ExOpenAI.Components.DeletedRoleAssignmentResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after unassigning a role.

  ## Fields

  * `:deleted` - **required** - `boolean()`  
    Whether the assignment was removed.

  * `:object` - **required** - `String.t()`  
    Identifier for the deleted assignment, such as `group.role.deleted` or `user.role.deleted`.
  """
  @type t() :: %{__struct__: __MODULE__, deleted: boolean(), object: String.t()}
  defstruct [:deleted, :object]
end
