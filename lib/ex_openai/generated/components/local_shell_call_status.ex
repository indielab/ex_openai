defmodule ExOpenAI.Components.LocalShellCallStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema LocalShellCallStatus.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
end
