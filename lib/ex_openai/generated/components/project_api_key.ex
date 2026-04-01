defmodule ExOpenAI.Components.ProjectApiKey do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual API key in a project.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the API key was created

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:last_used_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the API key was last used.

  * `:name` - **required** - `String.t()`  
    The name of the API key

  * `:object` - **required** - `:"organization.project.api_key"`  
    The object type, which is always `organization.project.api_key`  
    Allowed values: `"organization.project.api_key"`

  * `:owner` - **required** - `{:%{}, [], [{{:optional, [], [:service_account]}, {{:., [], [ExOpenAI.Components.ProjectServiceAccount, :t]}, [], []}}, {{:optional, [], [:type]}, {:|, [], [:user, :service_account]}}, {{:optional, [], [:user]}, {{:., [], [ExOpenAI.Components.ProjectUser, :t]}, [], []}}]}`

  * `:redacted_value` - **required** - `String.t()`  
    The redacted value of the API key
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          last_used_at: integer(),
          name: String.t(),
          object: :"organization.project.api_key",
          owner: %{
            optional(:service_account) => ExOpenAI.Components.ProjectServiceAccount.t(),
            optional(:type) => :user | :service_account,
            optional(:user) => ExOpenAI.Components.ProjectUser.t()
          },
          redacted_value: String.t()
        }
  defstruct [:created_at, :id, :last_used_at, :name, :object, :owner, :redacted_value]
end
