defmodule ExOpenAI.Components.ApplyPatchToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Allows the assistant to create, delete, or update files using unified diffs.

  ## Fields

  * `:type` - **required** - `:apply_patch`  
    The type of the tool. Always `apply_patch`.  
    Allowed values: `"apply_patch"`  
    Default: `"apply_patch"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :apply_patch}
  defstruct [:type]
end
