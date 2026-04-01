defmodule ExOpenAI.Components.ApplyPatchDeleteFileOperationParam do
  use ExOpenAI.Jason

  @moduledoc """
  Instruction for deleting an existing file via the apply_patch tool.

  ## Fields

  * `:path` - **required** - `String.t()`  
    Path of the file to delete relative to the workspace root.  
    Constraints: minLength: 1

  * `:type` - **required** - `:delete_file`  
    The operation type. Always `delete_file`.  
    Allowed values: `"delete_file"`  
    Default: `"delete_file"`
  """
  @type t() :: %{__struct__: __MODULE__, path: String.t(), type: :delete_file}
  defstruct [:path, :type]
end
