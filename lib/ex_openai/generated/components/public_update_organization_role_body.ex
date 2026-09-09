defmodule ExOpenAI.Components.PublicUpdateOrganizationRoleBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for updating an existing role.

  ## Fields

  * `:description` - **optional** - `String.t() | nil`
    New description for the role.

  * `:permissions` - **optional** - `list(String.t()) | nil`
    Updated set of permissions for the role.

  * `:role_name` - **optional** - `String.t() | nil`
    New name for the role.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          description: (String.t() | nil) | nil,
          permissions: (list(String.t()) | nil) | nil,
          role_name: (String.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:description) => String.t() | nil,
              optional(:permissions) => list(String.t()) | nil,
              optional(:role_name) => String.t() | nil
            }
  defstruct [:description, :permissions, :role_name]
end
