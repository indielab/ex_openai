defmodule ExOpenAI.Components.Invite do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual `invite` to the organization.

  ## Fields

  * `:accepted_at` - **optional** - `integer()`  
    The Unix timestamp (in seconds) of when the invite was accepted.

  * `:email` - **required** - `String.t()`  
    The email address of the individual to whom the invite was sent

  * `:expires_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the invite expires.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:invited_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the invite was sent.

  * `:object` - **required** - `:"organization.invite"`  
    The object type, which is always `organization.invite`  
    Allowed values: `"organization.invite"`

  * `:projects` - **optional** - `[{:%{}, [], [{{:optional, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:role]}, {:|, [], [:member, :owner]}}]}]`  
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
          accepted_at: integer() | nil,
          email: String.t(),
          expires_at: integer(),
          id: String.t(),
          invited_at: integer(),
          object: :"organization.invite",
          projects:
            list(%{optional(:id) => String.t(), optional(:role) => :member | :owner}) | nil,
          role: :owner | :reader,
          status: (:accepted | :expired) | :pending
        }
  defstruct [
    :accepted_at,
    :email,
    :expires_at,
    :id,
    :invited_at,
    :object,
    :projects,
    :role,
    :status
  ]
end
