defmodule ExOpenAI.Components.ProjectServiceAccountCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountCreateResponse.

  ## Fields

  * `:api_key` - **required** - `ExOpenAI.Components.ProjectServiceAccountApiKey.t() | nil`

  * `:created_at` - **required** - `integer()`
    Format: `unixtime`

  * `:id` - **required** - `String.t()`

  * `:name` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.service_account"`
    Allowed values: `"organization.project.service_account"`

  * `:role` - **required** - `:member | :none`
    Service accounts created with default project membership have role `member`. Accounts created with `create_service_account_only` have role `none`.
    Allowed values: `"member"`, `"none"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key: ExOpenAI.Components.ProjectServiceAccountApiKey.t() | nil,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.service_account",
          role: :member | :none
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:api_key) => ExOpenAI.Components.ProjectServiceAccountApiKey.input() | nil,
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :"organization.project.service_account" | String.t(),
              required(:role) => (:member | :none) | String.t()
            }
  defstruct [:api_key, :created_at, :id, :name, :object, :role]
end
