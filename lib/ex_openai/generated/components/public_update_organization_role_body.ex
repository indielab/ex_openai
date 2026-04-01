defmodule ExOpenAI.Components.PublicUpdateOrganizationRoleBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for updating an existing role.

  ## Fields

  * `:description` - **optional** - `String.t() | any()`  
    New description for the role.

  * `:permissions` - **optional** - `[String.t()] | any()`  
    Updated set of permissions for the role.

  * `:role_name` - **optional** - `String.t() | any()`  
    New name for the role.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | any()) | nil,
          permissions: (list(String.t()) | any()) | nil,
          role_name: (String.t() | any()) | nil
        }
  defstruct [:description, :permissions, :role_name]
end
