defmodule ExOpenAI.Components.ProjectServiceAccountDeleteResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectServiceAccountDeleteResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.service_account.deleted"`  
    Allowed values: `"organization.project.service_account.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"organization.project.service_account.deleted"
        }
  defstruct [:deleted, :id, :object]
end
