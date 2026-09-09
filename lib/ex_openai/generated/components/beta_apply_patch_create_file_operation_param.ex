defmodule ExOpenAI.Components.BetaApplyPatchCreateFileOperationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction for creating a new file via the apply_patch tool.

  ## Fields

  * `:diff` - **required** - `String.t()`
    Unified diff content to apply when creating the file.
    Constraints: maxLength: 10485760

  * `:path` - **required** - `String.t()`
    Path of the file to create relative to the workspace root.
    Constraints: minLength: 1

  * `:type` - **required** - `:create_file`
    The operation type. Always `create_file`.
    Allowed values: `"create_file"`
    Default: `"create_file"`
  """
  @type t() :: %{__struct__: __MODULE__, diff: String.t(), path: String.t(), type: :create_file}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:diff) => String.t(),
              required(:path) => String.t(),
              required(:type) => :create_file | String.t()
            }
  defstruct [:diff, :path, :type]
end
