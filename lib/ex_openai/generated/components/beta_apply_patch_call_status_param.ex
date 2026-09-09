defmodule ExOpenAI.Components.BetaApplyPatchCallStatusParam do
  @moduledoc """
  Status values reported for apply_patch tool calls.

  ## Type

  `:in_progress | :completed`

  ## Allowed Values

  `"in_progress"`, `"completed"`
  """
  @type t() :: :in_progress | :completed
  @type input() :: (:in_progress | :completed) | String.t()
end
