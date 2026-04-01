defmodule ExOpenAI.Components.ProjectServiceAccountApiKey do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountApiKey.

  ## Fields

  * `:created_at` - **required** - `integer()`

  * `:id` - **required** - `String.t()`

  * `:name` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.service_account.api_key"`  
    The object type, which is always `organization.project.service_account.api_key`  
    Allowed values: `"organization.project.service_account.api_key"`

  * `:value` - **required** - `String.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          id: String.t(),
          name: String.t(),
          object: :"organization.project.service_account.api_key",
          value: String.t()
        }
  defstruct [:created_at, :id, :name, :object, :value]
end
