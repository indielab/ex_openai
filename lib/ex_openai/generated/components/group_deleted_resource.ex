defmodule ExOpenAI.Components.GroupDeletedResource do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting a group.

  ## Fields

  * `:deleted` - **required** - `boolean()`  
    Whether the group was deleted.

  * `:id` - **required** - `String.t()`  
    Identifier of the deleted group.

  * `:object` - **required** - `:"group.deleted"`  
    Always `group.deleted`.  
    Allowed values: `"group.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"group.deleted"
        }
  defstruct [:deleted, :id, :object]
end
