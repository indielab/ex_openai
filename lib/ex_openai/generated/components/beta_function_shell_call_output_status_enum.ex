defmodule ExOpenAI.Components.BetaFunctionShellCallOutputStatusEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaFunctionShellCallOutputStatusEnum.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
  @type input() :: ((:in_progress | :completed) | :incomplete) | String.t()
end
