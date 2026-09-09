defmodule ExOpenAI.Components.BetaFunctionCallStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaFunctionCallStatus.

  ## Type

  `:in_progress | :completed | :incomplete`

  ## Allowed Values

  `"in_progress"`, `"completed"`, `"incomplete"`
  """
  @type t() :: (:in_progress | :completed) | :incomplete
  @type input() :: ((:in_progress | :completed) | :incomplete) | String.t()
end
