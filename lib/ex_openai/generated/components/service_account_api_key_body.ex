defmodule ExOpenAI.Components.ServiceAccountApiKeyBody do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ServiceAccountApiKeyBody.

  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) when the API key was created.
    Format: `unixtime`

  * `:id` - **required** - `String.t()`
    The identifier of the API key.

  * `:name` - **required** - `String.t()`
    The name of the API key.

  * `:object` - **required** - `:"organization.project.service_account.api_key"`
    The object type, which is always `organization.project.service_account.api_key`
    Allowed values: `"organization.project.service_account.api_key"`
    Default: `"organization.project.service_account.api_key"`

  * `:value` - **required** - `String.t()`
    The unredacted API key value.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.service_account.api_key",
          value: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:object) => :"organization.project.service_account.api_key" | String.t(),
              required(:value) => String.t()
            }
  defstruct [:created_at, :id, :name, :object, :value]
end
