defmodule ExOpenAI.Components.GroupMemberUser do
  use ExOpenAI.Jason

  @moduledoc """
  Details about a user returned from an organization group membership lookup.

  ## Fields

  * `:email` - **required** - `String.t() | nil`
    Email address of the user, or `null` for users without an email.

  * `:id` - **required** - `String.t()`
    Identifier for the user.

  * `:is_service_account` - **required** - `boolean() | nil`
    Whether the user is a service account.

  * `:name` - **required** - `String.t()`
    Display name of the user.

  * `:picture` - **required** - `String.t() | nil`
    URL of the user's profile picture, if available.

  * `:user_type` - **required** - `:user | :tenant_user`
    The type of user.
    Allowed values: `"user"`, `"tenant_user"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          email: String.t() | nil,
          id: String.t(),
          is_service_account: boolean() | nil,
          name: String.t(),
          picture: String.t() | nil,
          user_type: :user | :tenant_user
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:email) => String.t() | nil,
              required(:id) => String.t(),
              required(:is_service_account) => boolean() | nil,
              required(:name) => String.t(),
              required(:picture) => String.t() | nil,
              required(:user_type) => (:user | :tenant_user) | String.t()
            }
  defstruct [:email, :id, :is_service_account, :name, :picture, :user_type]
end
