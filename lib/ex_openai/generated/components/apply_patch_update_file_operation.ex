defmodule ExOpenAI.Components.ApplyPatchUpdateFileOperation do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction describing how to update a file via the apply_patch tool.

  ## Fields

  * `:diff` - **required** - `String.t()`
    Diff to apply.

  * `:path` - **required** - `String.t()`
    Path of the file to update.

  * `:type` - **required** - `:update_file`
    Update an existing file with the provided diff.
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
