defmodule ExOpenAI.Components.Role do
  use ExOpenAI.Jason

  @moduledoc """
  Details about a role that can be assigned through the public Roles API.

  ## Fields

  * `:description` - **required** - `String.t() | nil`
    Optional description of the role.

  * `:id` - **required** - `String.t()`
    Identifier for the role.

  * `:name` - **required** - `String.t()`
    Unique name for the role.

  * `:object` - **required** - `:role`
    Always `role`.
    Allowed values: `"role"`

  * `:permissions` - **required** - `list(String.t())`
    Permissions granted by the role.

  * `:predefined_role` - **required** - `boolean()`
    Whether the role is predefined and managed by OpenAI.

  * `:resource_type` - **required** - `String.t()`
    Resource type the role is bound to (for example `api.organization` or `api.project`).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: String.t() | nil,
          id: String.t(),
          name: String.t(),
          object: :role,
          permissions: list(String.t()),
          predefined_role: boolean(),
          resource_type: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:description) => String.t() | nil,
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :role | String.t(),
              required(:permissions) => list(String.t()),
              required(:predefined_role) => boolean(),
              required(:resource_type) => String.t()
            }
  defstruct [:description, :id, :name, :object, :permissions, :predefined_role, :resource_type]
end
