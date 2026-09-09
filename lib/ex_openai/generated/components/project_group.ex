defmodule ExOpenAI.Components.ProjectGroup do
  use ExOpenAI.Jason

  @moduledoc """
  Details about a group's membership in a project.

  ## Fields

  * `:created_at` - **required** - `integer()`
    Unix timestamp (in seconds) when the group was granted project access.
    Format: `unixtime`

  * `:group_id` - **required** - `String.t()`
    Identifier of the group that has access to the project.

  * `:group_name` - **required** - `String.t()`
    Display name of the group.

  * `:group_type` - **required** - `:group | :tenant_group`
    The type of the group.
    Allowed values: `"group"`, `"tenant_group"`

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
          group_type: :group | :tenant_group,
          object: :"project.group",
          project_id: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:group_id) => String.t(),
              required(:group_name) => String.t(),
              required(:group_type) => (:group | :tenant_group) | String.t(),
              required(:object) => :"project.group" | String.t(),
              required(:project_id) => String.t()
            }
  defstruct [:created_at, :group_id, :group_name, :group_type, :object, :project_id]
end
