defmodule ExOpenAI.Components.ProjectModelPermissions do
  use ExOpenAI.Jason

  @moduledoc """
  Represents the model allowlist or denylist policy for a project.

  ## Fields

  * `:mode` - **required** - `:allow_list | :deny_list`
    Whether the project uses an allowlist or a denylist.
    Allowed values: `"allow_list"`, `"deny_list"`

  * `:model_ids` - **required** - `list(String.t())`
    The model IDs included in the model permissions policy.

  * `:object` - **required** - `:"project.model_permissions"`
    The object type, which is always `project.model_permissions`.
    Allowed values: `"project.model_permissions"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          mode: :allow_list | :deny_list,
          model_ids: list(String.t()),
          object: :"project.model_permissions"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:mode) => (:allow_list | :deny_list) | String.t(),
              required(:model_ids) => list(String.t()),
              required(:object) => :"project.model_permissions" | String.t()
            }
  defstruct [:mode, :model_ids, :object]
end
