defmodule ExOpenAI.Components.PublicCreateOrganizationRoleBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for creating a custom role.

  ## Fields

  * `:description` - **optional** - `String.t() | any()`  
    Optional description of the role.

  * `:permissions` - **required** - `[String.t()]`  
    Permissions to grant to the role.

  * `:role_name` - **required** - `String.t()`  
    Unique name for the role.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | any()) | nil,
          permissions: list(String.t()),
          role_name: String.t()
        }
  defstruct [:description, :permissions, :role_name]
end
