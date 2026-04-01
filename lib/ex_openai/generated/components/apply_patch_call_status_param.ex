defmodule ExOpenAI.Components.ApplyPatchCallStatusParam do
  use ExOpenAI.Jason

  @moduledoc """
  Status values reported for apply_patch tool calls.

  ## Type

  `:in_progress | :completed`

  ## Allowed Values

  `"in_progress"`, `"completed"`
  """
  @type t() :: :in_progress | :completed
end
