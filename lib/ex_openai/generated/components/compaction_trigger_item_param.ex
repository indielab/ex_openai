defmodule ExOpenAI.Components.CompactionTriggerItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Compacts the current context. Must be the final input item.

  ## Fields

  * `:type` - **required** - `:compaction_trigger`
    The type of the item. Always `compaction_trigger`.
    Allowed values: `"compaction_trigger"`
    Default: `"compaction_trigger"`
  """
  @type t() :: %{__struct__: __MODULE__, type: :compaction_trigger}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :compaction_trigger | String.t()}
  defstruct [:type]
end
