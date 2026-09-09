defmodule ExOpenAI.Components.ProjectApiKey do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual API key in a project.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the API key was created
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:last_used_at` - **required** - `integer() | nil`
    The Unix timestamp (in seconds) of when the API key was last used.

  * `:name` - **required** - `String.t()`
    The name of the API key

  * `:object` - **required** - `:"organization.project.api_key"`
    The object type, which is always `organization.project.api_key`
    Allowed values: `"organization.project.api_key"`

  * `:owner` - **required** - `%{ optional(:service_account) => ExOpenAI.Components.ProjectApiKeyOwnerServiceAccount.t(), optional(:type) => :user | :service_account, optional(:user) => ExOpenAI.Components.ProjectApiKeyOwnerUser.t() }`

  * `:owner_project_access` - **required** - `:active | :inactive`
    Whether the API key's owner currently has effective access to the project.
    Allowed values: `"active"`, `"inactive"`

  * `:redacted_value` - **required** - `String.t()`
    The redacted value of the API key
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          last_used_at: integer() | nil,
          name: String.t(),
          object: :"organization.project.api_key",
          owner: %{
            optional(:service_account) =>
              ExOpenAI.Components.ProjectApiKeyOwnerServiceAccount.t(),
            optional(:type) => :user | :service_account,
            optional(:user) => ExOpenAI.Components.ProjectApiKeyOwnerUser.t()
          },
          owner_project_access: :active | :inactive,
          redacted_value: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:last_used_at) => integer() | nil,
              required(:name) => String.t(),
              required(:object) => :"organization.project.api_key" | String.t(),
              required(:owner) => %{
                optional(:service_account) =>
                  ExOpenAI.Components.ProjectApiKeyOwnerServiceAccount.input(),
                optional(:type) => (:user | :service_account) | String.t(),
                optional(:user) => ExOpenAI.Components.ProjectApiKeyOwnerUser.input()
              },
              required(:owner_project_access) => (:active | :inactive) | String.t(),
              required(:redacted_value) => String.t()
            }
  defstruct [
    :created_at,
    :id,
    :last_used_at,
    :name,
    :object,
    :owner,
    :owner_project_access,
    :redacted_value
  ]
end
