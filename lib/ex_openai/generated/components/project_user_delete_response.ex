defmodule ExOpenAI.Components.ProjectUserDeleteResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectUserDeleteResponse.

  ## Fields

  * `:deleted` - **required** - `boolean()`

  * `:id` - **required** - `String.t()`

  * `:object` - **required** - `:"organization.project.user.deleted"`
    Allowed values: `"organization.project.user.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          id: String.t(),
          object: :"organization.project.user.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:id) => String.t(),
              required(:object) => :"organization.project.user.deleted" | String.t()
            }
  defstruct [:deleted, :id, :object]
end
