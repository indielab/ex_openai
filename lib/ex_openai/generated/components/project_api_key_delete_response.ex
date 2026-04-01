defmodule ExOpenAI.Components.ProjectApiKeyDeleteResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectApiKeyDeleteResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.api_key.deleted"`  
    Allowed values: `"organization.project.api_key.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"organization.project.api_key.deleted"
        }
  defstruct [:deleted, :id, :object]
end
