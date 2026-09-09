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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"organization.project.service_account.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
