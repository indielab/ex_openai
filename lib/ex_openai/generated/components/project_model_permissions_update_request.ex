defmodule ExOpenAI.Components.ProjectModelPermissionsUpdateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ProjectModelPermissionsUpdateRequest.

  ## Fields

  * `:mode` - **required** - `:allow_list | :deny_list`
    The model permissions mode to apply.
    Allowed values: `"allow_list"`, `"deny_list"`

  * `:model_ids` - **required** - `list(String.t())`
    The model IDs included in this permissions policy.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          mode: :allow_list | :deny_list,
          model_ids: list(String.t())
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:mode) => (:allow_list | :deny_list) | String.t(),
              required(:model_ids) => list(String.t())
            }
  defstruct [:mode, :model_ids]
end
