defmodule ExOpenAI.Components.ProjectUser do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual user in a project.

  ## Fields

  * `:added_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the project was added.

  * `:email` - **required** - `String.t()`  
    The email address of the user

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`  
    The name of the user

  * `:object` - **required** - `:"organization.project.user"`  
    The object type, which is always `organization.project.user`  
    Allowed values: `"organization.project.user"`

  * `:role` - **required** - `:owner | :member`  
    `owner` or `member`  
    Allowed values: `"owner"`, `"member"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          added_at: integer(),
          email: String.t(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.user",
          role: :owner | :member
        }
  defstruct [:added_at, :email, :id, :name, :object, :role]
end
