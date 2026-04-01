defmodule ExOpenAI.Components.AssignedRoleDetails do
  use ExOpenAI.Jason

  @moduledoc """
  Detailed information about a role assignment entry returned when listing assignments.

  ## Fields

  * `:created_at` - **required** - `integer() | any()`  
    When the role was created.

  * `:created_by` - **required** - `String.t() | any()`  
    Identifier of the actor who created the role.

  * `:created_by_user_obj` - **required** - `map() | any()`  
    User details for the actor that created the role, when available.

  * `:description` - **required** - `String.t() | any()`  
    Description of the role.

  * `:id` - **required** - `String.t()`  
    Identifier for the role.

  * `:metadata` - **required** - `map() | any()`  
    Arbitrary metadata stored on the role.

  * `:name` - **required** - `String.t()`  
    Name of the role.

  * `:permissions` - **required** - `[String.t()]`  
    Permissions associated with the role.

  * `:predefined_role` - **required** - `boolean()`  
    Whether the role is predefined by OpenAI.

  * `:resource_type` - **required** - `String.t()`  
    Resource type the role applies to.

  * `:updated_at` - **required** - `integer() | any()`  
    When the role was last updated.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer() | any(),
          created_by: String.t() | any(),
          created_by_user_obj: map() | any(),
          description: String.t() | any(),
          id: String.t(),
          metadata: map() | any(),
          name: String.t(),
          permissions: list(String.t()),
          predefined_role: boolean(),
          resource_type: String.t(),
          updated_at: integer() | any()
        }
  defstruct [
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
