defmodule ExOpenAI.Components.ApplyPatchCallOutputStatusParam do
  @moduledoc """
  Outcome values reported for apply_patch tool call outputs.

  ## Type

  `:completed | :failed`

  ## Allowed Values

  `"completed"`, `"failed"`
  """
  @type t() :: :completed | :failed
  @type input() :: (:completed | :failed) | String.t()
end
