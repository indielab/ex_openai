defmodule ExOpenAI.Components.BetaComputerCallOutputStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaComputerCallOutputStatus.

  ## Type

  `:completed | :incomplete | :failed`

  ## Allowed Values

  `"completed"`, `"incomplete"`, `"failed"`
  """
  @type t() :: (:completed | :incomplete) | :failed
  @type input() :: ((:completed | :incomplete) | :failed) | String.t()
end
