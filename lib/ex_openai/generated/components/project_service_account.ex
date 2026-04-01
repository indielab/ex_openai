defmodule ExOpenAI.Components.ProjectServiceAccount do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual service account in a project.

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the service account was created

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`  
    The name of the service account

  * `:object` - **required** - `:"organization.project.service_account"`  
    The object type, which is always `organization.project.service_account`  
    Allowed values: `"organization.project.service_account"`

  * `:role` - **required** - `:owner | :member`  
    `owner` or `member`  
    Allowed values: `"owner"`, `"member"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.service_account",
          role: :owner | :member
        }
  defstruct [:created_at, :id, :name, :object, :role]
end
