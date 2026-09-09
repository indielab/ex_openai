defmodule ExOpenAI.Components.ApplyPatchCreateFileOperation do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction describing how to create a file via the apply_patch tool.

  ## Fields

  * `:diff` - **required** - `String.t()`
    Diff to apply.

  * `:path` - **required** - `String.t()`
    Path of the file to create.

  * `:type` - **required** - `:create_file`
    Create a new file with the provided diff.
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
