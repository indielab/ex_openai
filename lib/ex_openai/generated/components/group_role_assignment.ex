defmodule ExOpenAI.Components.GroupRoleAssignment do
  use ExOpenAI.Jason

  @moduledoc """
  Role assignment linking a group to a role.

  ## Fields

  * `:group` - **required** - `ExOpenAI.Components.Group.t()`

  * `:object` - **required** - `:"group.role"`  
    Always `group.role`.  
    Allowed values: `"group.role"`

  * `:role` - **required** - `ExOpenAI.Components.Role.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          group: ExOpenAI.Components.Group.t(),
          object: :"group.role",
          role: ExOpenAI.Components.Role.t()
        }
  defstruct [:group, :object, :role]
end
