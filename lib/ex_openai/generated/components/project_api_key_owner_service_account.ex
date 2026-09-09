defmodule ExOpenAI.Components.ProjectApiKeyOwnerServiceAccount do
  use ExOpenAI.Jason

  @moduledoc """
  The service account that owns a project API key.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the service account was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`
    The name of the service account.

  * `:role` - **required** - `String.t()`
    The service account's project role.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          role: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:role) => String.t()
            }
  defstruct [:created_at, :id, :name, :role]
end
