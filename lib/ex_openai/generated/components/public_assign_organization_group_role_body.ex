defmodule ExOpenAI.Components.PublicAssignOrganizationGroupRoleBody do
  use ExOpenAI.Jason

  @moduledoc """
  Request payload for assigning a role to a group or user.

  ## Fields

  * `:role_id` - **required** - `String.t()`
    Identifier of the role to assign.
  """
  @type t() :: %{__struct__: __MODULE__, role_id: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:role_id) => String.t()}
  defstruct [:role_id]
end
