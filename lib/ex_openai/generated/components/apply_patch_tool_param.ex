defmodule ExOpenAI.Components.ApplyPatchToolParam do
  use ExOpenAI.Jason

  @moduledoc """
  Allows the assistant to create, delete, or update files using unified diffs.

  ## Fields

  * `:allowed_callers` - **optional** - `list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil`

  * `:type` - **required** - `:apply_patch`
    The type of the tool. Always `apply_patch`.
    Allowed values: `"apply_patch"`
    Default: `"apply_patch"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          allowed_callers: (list(ExOpenAI.Components.CallableToolAllowedCaller.t()) | nil) | nil,
          type: :apply_patch
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:allowed_callers) =>
                list(ExOpenAI.Components.CallableToolAllowedCaller.input()) | nil,
              required(:type) => :apply_patch | String.t()
            }
  defstruct [:allowed_callers, :type]
end
