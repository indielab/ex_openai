defmodule ExOpenAI.Components.ApplyPatchCallOutputStatusParam do
  use ExOpenAI.Jason

  @moduledoc """
  Outcome values reported for apply_patch tool call outputs.

  ## Type

  `:completed | :failed`

  ## Allowed Values

  `"completed"`, `"failed"`
  """
  @type t() :: :completed | :failed
end
