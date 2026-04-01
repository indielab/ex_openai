defmodule ExOpenAI.Components.LocalShellCallOutputStatusEnum do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema LocalShellCallOutputStatusEnum.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
end
