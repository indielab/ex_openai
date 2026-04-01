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
  defstruct [:object, :role, :user]
end
