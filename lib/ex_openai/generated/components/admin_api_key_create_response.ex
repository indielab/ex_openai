defmodule ExOpenAI.Components.AdminApiKeyCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AdminApiKeyCreateResponse.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the API key was created
    Format: `unixtime`

  * `:expires_at` - **required** - `integer() | nil`

  * `:id` - **required** - `String.t()`
    The identifier, which can be referenced in API endpoints

  * `:last_used_at` - **optional** - `integer() | nil`

  * `:name` - **optional** - `String.t() | nil`
    The name of the API key

  * `:object` - **required** - `:"organization.admin_api_key"`
    The object type, which is always `organization.admin_api_key`
    Allowed values: `"organization.admin_api_key"`

  * `:owner` - **required** - `%{ optional(:created_at) => integer(), optional(:id) => String.t(), optional(:name) => String.t(), optional(:object) => String.t(), optional(:role) => String.t(), optional(:type) => String.t() }`

  * `:redacted_value` - **required** - `String.t()`
    The redacted value of the API key

  * `:value` - **required** - `String.t()`
    The value of the API key. Only shown on create.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          expires_at: integer() | nil,
          id: String.t(),
          last_used_at: (integer() | nil) | nil,
          name: (String.t() | nil) | nil,
          object: :"organization.admin_api_key",
          owner: %{
            optional(:created_at) => integer(),
            optional(:id) => String.t(),
            optional(:name) => String.t(),
            optional(:object) => String.t(),
            optional(:role) => String.t(),
            optional(:type) => String.t()
          },
          redacted_value: String.t(),
          value: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:expires_at) => integer() | nil,
              required(:id) => String.t(),
              optional(:last_used_at) => integer() | nil,
              optional(:name) => String.t() | nil,
              required(:object) => :"organization.admin_api_key" | String.t(),
              required(:owner) => %{
                optional(:created_at) => integer(),
                optional(:id) => String.t(),
                optional(:name) => String.t(),
                optional(:object) => String.t(),
                optional(:role) => String.t(),
                optional(:type) => String.t()
              },
              required(:redacted_value) => String.t(),
              required(:value) => String.t()
            }
  defstruct [
    :created_at,
    :expires_at,
    :id,
    :last_used_at,
    :name,
    :object,
    :owner,
    :redacted_value,
    :value
  ]
end
