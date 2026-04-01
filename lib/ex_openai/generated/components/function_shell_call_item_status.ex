defmodule ExOpenAI.Components.FunctionShellCallItemStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Status values reported for shell tool calls.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
end
