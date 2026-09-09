defmodule ExOpenAI.Components.ProjectUser do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual user in a project.

  ## Fields

  * `:added_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the project was added.
    Format: `unixtime`

  * `:email` - **optional** - `String.t() | nil`
    The email address of the user

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:name` - **optional** - `String.t() | nil`
    The name of the user

  * `:object` - **required** - `:"organization.project.user"`
    The object type, which is always `organization.project.user`
    Allowed values: `"organization.project.user"`

  * `:role` - **required** - `String.t()`
    `owner` or `member`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          added_at: integer(),
          email: (String.t() | nil) | nil,
          id: String.t(),
          name: (String.t() | nil) | nil,
          object: :"organization.project.user",
          role: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:added_at) => integer(),
              optional(:email) => String.t() | nil,
              required(:id) => String.t(),
              optional(:name) => String.t() | nil,
              required(:object) => :"organization.project.user" | String.t(),
              required(:role) => String.t()
            }
  defstruct [:added_at, :email, :id, :name, :object, :role]
end
