defmodule ExOpenAI.Components.SpecificApplyPatchParam do
  use ExOpenAI.Jason

  @moduledoc """
  Forces the model to call the apply_patch tool when executing a tool call.

  ## Fields

  * `:type` - **required** - `:apply_patch`  
    The tool to call. Always `apply_patch`.  
    Allowed values: `"apply_patch"`  
    Default: `"apply_patch"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :apply_patch}
  defstruct [:type]
end
