defmodule ExOpenAI.Components.Invite do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual `invite` to the organization.

  ## Fields

  * `:accepted_at` - **optional** - `integer() | nil`
    The Unix timestamp (in seconds) of when the invite was accepted.

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the invite was sent.
    Format: `unixtime`

  * `:email` - **required** - `String.t()`
    The email address of the individual to whom the invite was sent

  * `:expires_at` - **optional** - `integer() | nil`
    The Unix timestamp (in seconds) of when the invite expires.

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:object` - **required** - `:"organization.invite"`
    The object type, which is always `organization.invite`
    Allowed values: `"organization.invite"`

  * `:projects` - **required** - `list(%{required(:id) => String.t(), required(:role) => :member | :owner})`
    The projects that were granted membership upon acceptance of the invite.

  * `:role` - **required** - `:owner | :reader`
    `owner` or `reader`
    Allowed values: `"owner"`, `"reader"`

  * `:status` - **required** - `:accepted | :expired | :pending`
    `accepted`,`expired`, or `pending`
    Allowed values: `"accepted"`, `"expired"`, `"pending"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          accepted_at: (integer() | nil) | nil,
          created_at: integer(),
          email: String.t(),
          expires_at: (integer() | nil) | nil,
          id: String.t(),
          object: :"organization.invite",
          projects: list(%{required(:id) => String.t(), required(:role) => :member | :owner}),
          role: :owner | :reader,
          status: (:accepted | :expired) | :pending
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:accepted_at) => integer() | nil,
              required(:created_at) => integer(),
              required(:email) => String.t(),
              optional(:expires_at) => integer() | nil,
              required(:id) => String.t(),
              required(:object) => :"organization.invite" | String.t(),
              required(:projects) =>
                list(%{
                  required(:id) => String.t(),
                  required(:role) => (:member | :owner) | String.t()
                }),
              required(:role) => (:owner | :reader) | String.t(),
              required(:status) => ((:accepted | :expired) | :pending) | String.t()
            }
  defstruct [
    :accepted_at,
    :created_at,
    :email,
    :expires_at,
    :id,
    :object,
    :projects,
    :role,
    :status
  ]
end
