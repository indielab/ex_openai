defmodule ExOpenAI.Components.RealtimeReasoningEffort do
  @moduledoc """
  Constrains effort on reasoning for reasoning-capable Realtime models such as
  `gpt-realtime-2`.


  ## Type

  `:minimal | :low | :medium | :high | :xhigh`

  ## Allowed Values

  `"minimal"`, `"low"`, `"medium"`, `"high"`, `"xhigh"`
  """
  @type t() :: (((:minimal | :low) | :medium) | :high) | :xhigh
  @type input() :: ((((:minimal | :low) | :medium) | :high) | :xhigh) | String.t()
end
