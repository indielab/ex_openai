defmodule ExOpenAI.Components.ProjectGroup do
  use ExOpenAI.Jason

  @moduledoc """
  Details about a group's membership in a project.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    Unix timestamp (in seconds) when the group was granted project access.  
    Format: `int64`

  * `:group_id` - **required** - `String.t()`  
    Identifier of the group that has access to the project.

  * `:group_name` - **required** - `String.t()`  
    Display name of the group.

  * `:object` - **required** - `:"project.group"`  
    Always `project.group`.  
    Allowed values: `"project.group"`

  * `:project_id` - **required** - `String.t()`  
    Identifier of the project.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          group_id: String.t(),
          group_name: String.t(),
          object: :"project.group",
          project_id: String.t()
        }
  defstruct [:created_at, :group_id, :group_name, :object, :project_id]
end
