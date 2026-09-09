defmodule ExOpenAI.Components.UpdateProjectServiceAccountBody do
  use ExOpenAI.Jason

  @moduledoc """
  Parameters for updating a project service account.

  ## Fields

  * `:name` - **optional** - `String.t()`
    The updated service account name.

  * `:role` - **optional** - `:member | :owner`
    The updated service account role.
    Allowed values: `"member"`, `"owner"`
  """
  @type t() :: %{__struct__: __MODULE__, name: String.t() | nil, role: (:member | :owner) | nil}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{optional(:name) => String.t(), optional(:role) => (:member | :owner) | String.t()}
  defstruct [:name, :role]
end
