defmodule ExOpenAI.Components.RoleDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a role.

  ## Fields

  * `:deleted` - **required** - `boolean()`  
    Whether the role was deleted.

  * `:id` - **required** - `String.t()`  
    Identifier of the deleted role.

  * `:object` - **required** - `:"role.deleted"`  
    Always `role.deleted`.  
    Allowed values: `"role.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"role.deleted"
        }
  defstruct [:deleted, :id, :object]
end
