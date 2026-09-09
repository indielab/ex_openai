defmodule ExOpenAI.Components.User do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual `user` within an organization.

  ## Fields

  * `:added_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the user was added.
    Format: `unixtime`

  * `:api_key_last_used_at` - **optional** - `integer() | nil`
    The Unix timestamp (in seconds) of the user's last API key usage.

  * `:created` - **optional** - `integer()`
    The Unix timestamp (in seconds) of when the user was created.
    Format: `unixtime`

  * `:developer_persona` - **optional** - `String.t() | nil`
    The developer persona metadata for the user.

  * `:email` - **optional** - `String.t() | nil`
    The email address of the user

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:is_default` - **optional** - `boolean()`
    Whether this is the organization's default user.

  * `:is_scale_tier_authorized_purchaser` - **optional** - `boolean() | nil`
    Whether the user is an authorized purchaser for Scale Tier.

  * `:is_scim_managed` - **optional** - `boolean()`
    Whether the user is managed through SCIM.

  * `:is_service_account` - **optional** - `boolean()`
    Whether the user is a service account.

  * `:name` - **optional** - `String.t() | nil`
    The name of the user

  * `:object` - **required** - `:"organization.user"`
    The object type, which is always `organization.user`
    Allowed values: `"organization.user"`

  * `:projects` - **optional** - `%{ required(:data) => list(%{ optional(:id) => String.t() | nil, optional(:name) => String.t() | nil, optional(:role) => String.t() | nil }), required(:object) => :list } | nil`
    Projects associated with the user, if included.

  * `:role` - **optional** - `String.t() | nil`
    `owner` or `reader`

  * `:technical_level` - **optional** - `String.t() | nil`
    The technical level metadata for the user.

  * `:user` - **optional** - `%{ optional(:banned) => boolean() | nil, optional(:banned_at) => integer() | nil, optional(:email) => String.t() | nil, optional(:enabled) => boolean() | nil, required(:id) => String.t(), optional(:name) => String.t() | nil, required(:object) => :user, optional(:picture) => String.t() | nil }`
    Nested user details.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          added_at: integer(),
          api_key_last_used_at: (integer() | nil) | nil,
          created: integer() | nil,
          developer_persona: (String.t() | nil) | nil,
          email: (String.t() | nil) | nil,
          id: String.t(),
          is_default: boolean() | nil,
          is_scale_tier_authorized_purchaser: (boolean() | nil) | nil,
          is_scim_managed: boolean() | nil,
          is_service_account: boolean() | nil,
          name: (String.t() | nil) | nil,
          object: :"organization.user",
          projects:
            (%{
               required(:data) =>
                 list(%{
                   optional(:id) => String.t() | nil,
                   optional(:name) => String.t() | nil,
                   optional(:role) => String.t() | nil
                 }),
               required(:object) => :list
             }
             | nil)
            | nil,
          role: (String.t() | nil) | nil,
          technical_level: (String.t() | nil) | nil,
          user:
            %{
              optional(:banned) => boolean() | nil,
              optional(:banned_at) => integer() | nil,
              optional(:email) => String.t() | nil,
              optional(:enabled) => boolean() | nil,
              required(:id) => String.t(),
              optional(:name) => String.t() | nil,
              required(:object) => :user,
              optional(:picture) => String.t() | nil
            }
            | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:added_at) => integer(),
              optional(:api_key_last_used_at) => integer() | nil,
              optional(:created) => integer(),
              optional(:developer_persona) => String.t() | nil,
              optional(:email) => String.t() | nil,
              required(:id) => String.t(),
              optional(:is_default) => boolean(),
              optional(:is_scale_tier_authorized_purchaser) => boolean() | nil,
              optional(:is_scim_managed) => boolean(),
              optional(:is_service_account) => boolean(),
              optional(:name) => String.t() | nil,
              required(:object) => :"organization.user" | String.t(),
              optional(:projects) =>
                %{
                  required(:data) =>
                    list(%{
                      optional(:id) => String.t() | nil,
                      optional(:name) => String.t() | nil,
                      optional(:role) => String.t() | nil
                    }),
                  required(:object) => :list | String.t()
                }
                | nil,
              optional(:role) => String.t() | nil,
              optional(:technical_level) => String.t() | nil,
              optional(:user) => %{
                optional(:banned) => boolean() | nil,
                optional(:banned_at) => integer() | nil,
                optional(:email) => String.t() | nil,
                optional(:enabled) => boolean() | nil,
                required(:id) => String.t(),
                optional(:name) => String.t() | nil,
                required(:object) => :user | String.t(),
                optional(:picture) => String.t() | nil
              }
            }
  defstruct [
    :added_at,
    :api_key_last_used_at,
    :created,
    :developer_persona,
    :email,
    :id,
    :is_default,
    :is_scale_tier_authorized_purchaser,
    :is_scim_managed,
    :is_service_account,
    :name,
    :object,
    :projects,
    :role,
    :technical_level,
    :user
  ]
end
