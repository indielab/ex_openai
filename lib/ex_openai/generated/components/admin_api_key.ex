defmodule ExOpenAI.Components.AdminApiKey do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual Admin API key in an org.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the API key was created  
    Format: `int64`

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:last_used_at` - **required** - `integer() | any()`

  * `:name` - **required** - `String.t()`  
    The name of the API key

  * `:object` - **required** - `String.t()`  
    The object type, which is always `organization.admin_api_key`

  * `:owner` - **required** - `{:%{}, [], [{{:optional, [], [:created_at]}, {:integer, [], []}}, {{:optional, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:object]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:role]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:type]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`

  * `:redacted_value` - **required** - `String.t()`  
    The redacted value of the API key

  * `:value` - **optional** - `String.t()`  
    The value of the API key. Only shown on create.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          last_used_at: integer() | any(),
          name: String.t(),
          object: String.t(),
          owner: %{
            optional(:created_at) => integer(),
            optional(:id) => String.t(),
            optional(:name) => String.t(),
            optional(:object) => String.t(),
            optional(:role) => String.t(),
            optional(:type) => String.t()
          },
          redacted_value: String.t(),
          value: String.t() | nil
        }
  defstruct [:created_at, :id, :last_used_at, :name, :object, :owner, :redacted_value, :value]
end
