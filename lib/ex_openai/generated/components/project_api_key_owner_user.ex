defmodule ExOpenAI.Components.ProjectApiKeyOwnerUser do
  use ExOpenAI.Jason

  @moduledoc """
  The user that owns a project API key.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the user was created.
    Format: `unixtime`

  * `:email` - **required** - `String.t()`
    The email address of the user.

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`
    The name of the user.

  * `:role` - **required** - `String.t()`
    The user's project role.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          email: String.t(),
          id: String.t(),
          name: String.t(),
          role: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:email) => String.t(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:role) => String.t()
            }
  defstruct [:created_at, :email, :id, :name, :role]
end
