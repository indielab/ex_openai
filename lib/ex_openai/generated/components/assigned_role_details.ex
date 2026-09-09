defmodule ExOpenAI.Components.AssignedRoleDetails do
  use ExOpenAI.Jason

  @moduledoc """
  Detailed information about a role assignment entry returned when listing assignments.

  ## Fields

  * `:assignment_sources` - **required** - `list(%{required(:principal_id) => String.t(), required(:principal_type) => String.t()}) | nil`
    Principals from which the role assignment is inherited, when available.

  * `:created_at` - **required** - `integer() | nil`
    When the role was created.

  * `:created_by` - **required** - `String.t() | nil`
    Identifier of the actor who created the role.

  * `:created_by_user_obj` - **required** - `map() | nil`
    User details for the actor that created the role, when available.

  * `:description` - **required** - `String.t() | nil`
    Description of the role.

  * `:id` - **required** - `String.t()`
    Identifier for the role.

  * `:metadata` - **required** - `map() | nil`
    Arbitrary metadata stored on the role.

  * `:name` - **required** - `String.t()`
    Name of the role.

  * `:permissions` - **required** - `list(String.t())`
    Permissions associated with the role.

  * `:predefined_role` - **required** - `boolean()`
    Whether the role is predefined by OpenAI.

  * `:resource_type` - **required** - `String.t()`
    Resource type the role applies to.

  * `:updated_at` - **required** - `integer() | nil`
    When the role was last updated.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          assignment_sources:
            list(%{required(:principal_id) => String.t(), required(:principal_type) => String.t()})
            | nil,
          created_at: integer() | nil,
          created_by: String.t() | nil,
          created_by_user_obj: map() | nil,
          description: String.t() | nil,
          id: String.t(),
          metadata: map() | nil,
          name: String.t(),
          permissions: list(String.t()),
          predefined_role: boolean(),
          resource_type: String.t(),
          updated_at: integer() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:assignment_sources) =>
                list(%{
                  required(:principal_id) => String.t(),
                  required(:principal_type) => String.t()
                })
                | nil,
              required(:created_at) => integer() | nil,
              required(:created_by) => String.t() | nil,
              required(:created_by_user_obj) => map() | nil,
              required(:description) => String.t() | nil,
              required(:id) => String.t(),
              required(:metadata) => map() | nil,
              required(:name) => String.t(),
              required(:permissions) => list(String.t()),
              required(:predefined_role) => boolean(),
              required(:resource_type) => String.t(),
              required(:updated_at) => integer() | nil
            }
  defstruct [
    :assignment_sources,
    :created_at,
    :created_by,
    :created_by_user_obj,
    :description,
    :id,
    :metadata,
    :name,
    :permissions,
    :predefined_role,
    :resource_type,
    :updated_at
  ]
end
