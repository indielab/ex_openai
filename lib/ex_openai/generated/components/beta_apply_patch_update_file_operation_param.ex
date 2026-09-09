defmodule ExOpenAI.Components.BetaApplyPatchUpdateFileOperationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction for updating an existing file via the apply_patch tool.

  ## Fields

  * `:diff` - **required** - `String.t()`
    Unified diff content to apply to the existing file.
    Constraints: maxLength: 10485760

  * `:path` - **required** - `String.t()`
    Path of the file to update relative to the workspace root.
    Constraints: minLength: 1

  * `:type` - **required** - `:update_file`
    The operation type. Always `update_file`.
    Allowed values: `"update_file"`
    Default: `"update_file"`
  """
  @type t() :: %{__struct__: __MODULE__, diff: String.t(), path: String.t(), type: :update_file}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:diff) => String.t(),
              required(:path) => String.t(),
              required(:type) => :update_file | String.t()
            }
  defstruct [:diff, :path, :type]
end
