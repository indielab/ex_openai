defmodule ExOpenAI.Components.ProjectServiceAccountCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountCreateResponse.

  ## Fields

  * `:api_key` - **required** - `ExOpenAI.Components.ProjectServiceAccountApiKey.t()`

  * `:created_at` - **required** - `integer()`

  * `:id` - **required** - `String.t()`

  * `:name` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.service_account"`  
    Allowed values: `"organization.project.service_account"`

  * `:role` - **required** - `:member`  
    Service accounts can only have one role of type `member`  
    Allowed values: `"member"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          api_key: ExOpenAI.Components.ProjectServiceAccountApiKey.t(),
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.service_account",
          role: :member
        }
  defstruct [:api_key, :created_at, :id, :name, :object, :role]
end
