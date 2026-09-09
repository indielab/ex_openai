defmodule ExOpenAI.Components.BetaApplyPatchDeleteFileOperation do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction describing how to delete a file via the apply_patch tool.

  ## Fields

  * `:path` - **required** - `String.t()`
    Path of the file to delete.

  * `:type` - **required** - `:delete_file`
    Delete the specified file.
    Allowed values: `"delete_file"`
    Default: `"delete_file"`
  """
  @type t() :: %{__struct__: __MODULE__, path: String.t(), type: :delete_file}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:path) => String.t(), required(:type) => :delete_file | String.t()}
  defstruct [:path, :type]
end
