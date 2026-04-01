defmodule ExOpenAI.Components.Project do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual project.

  ## Fields

  * `:archived_at` - **optional** - `integer() | any()`

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the project was created.

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`  
    The name of the project. This appears in reporting.

  * `:object` - **required** - `:"organization.project"`  
    The object type, which is always `organization.project`  
    Allowed values: `"organization.project"`

  * `:status` - **required** - `:active | :archived`  
    `active` or `archived`  
    Allowed values: `"active"`, `"archived"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          archived_at: (integer() | any()) | nil,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project",
          status: :active | :archived
        }
  defstruct [:archived_at, :created_at, :id, :name, :object, :status]
end
