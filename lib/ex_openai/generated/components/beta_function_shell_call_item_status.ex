defmodule ExOpenAI.Components.BetaFunctionShellCallItemStatus do
  @moduledoc """
  Status values reported for shell tool calls.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
  @type input() :: ((:in_progress | :completed) | :incomplete) | String.t()
end
