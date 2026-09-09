defmodule ExOpenAI.Components.RealtimeReasoning do
  use ExOpenAI.Jason

  @moduledoc """
  Configuration for reasoning-capable Realtime models such as `gpt-realtime-2`.


  ## Fields

  * `:effort` - **optional** - `ExOpenAI.Components.RealtimeReasoningEffort.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          effort: ExOpenAI.Components.RealtimeReasoningEffort.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{optional(:effort) => ExOpenAI.Components.RealtimeReasoningEffort.input()}
  defstruct [:effort]
end
