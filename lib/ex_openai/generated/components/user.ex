defmodule ExOpenAI.Components.User do
  use ExOpenAI.Jason

  @moduledoc """
  Represents an individual `user` within an organization.

  ## Fields

  * `:added_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the user was added.

  * `:email` - **required** - `String.t()`  
    The email address of the user

  * `:id` - **required** - `String.t()`  
    The identifier, which can be referenced in API endpoints

  * `:name` - **required** - `String.t()`  
    The name of the user

  * `:object` - **required** - `:"organization.user"`  
    The object type, which is always `organization.user`  
    Allowed values: `"organization.user"`

  * `:role` - **required** - `:owner | :reader`  
    `owner` or `reader`  
    Allowed values: `"owner"`, `"reader"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          added_at: integer(),
          email: String.t(),
          id: String.t(),
          name: String.t(),
          object: :"organization.user",
          role: :owner | :reader
        }
  defstruct [:added_at, :email, :id, :name, :object, :role]
end
