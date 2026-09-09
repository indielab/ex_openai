defmodule ExOpenAI.Components.ProjectModelPermissionsDeleteResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Confirmation payload returned after deleting project model permissions.

  ## Fields

  * `:deleted` - **required** - `boolean()`
    Whether the project model permissions were deleted.

  * `:object` - **required** - `:"project.model_permissions.deleted"`
    The object type, which is always `project.model_permissions.deleted`.
    Allowed values: `"project.model_permissions.deleted"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          deleted: boolean(),
          object: :"project.model_permissions.deleted"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:deleted) => boolean(),
              required(:object) => :"project.model_permissions.deleted" | String.t()
            }
  defstruct [:deleted, :object]
end
