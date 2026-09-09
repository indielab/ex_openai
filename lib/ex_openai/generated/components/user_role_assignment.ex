defmodule ExOpenAI.Components.UserRoleAssignment do
  use ExOpenAI.Jason

  @moduledoc """
  Role assignment linking a user to a role.

  ## Fields

  * `:object` - **required** - `:"user.role"`
    Always `user.role`.
    Allowed values: `"user.role"`

  * `:role` - **required** - `ExOpenAI.Components.Role.t()`

  * `:user` - **required** - `ExOpenAI.Components.User.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          object: :"user.role",
          role: ExOpenAI.Components.Role.t(),
          user: ExOpenAI.Components.User.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:object) => :"user.role" | String.t(),
              required(:role) => ExOpenAI.Components.Role.input(),
              required(:user) => ExOpenAI.Components.User.input()
            }
  defstruct [:object, :role, :user]
end
