defmodule ExOpenAI.Components.BetaComputerActionList do
  @moduledoc """
  Flattened batched actions for `computer_use`. Each action includes an
  `type` discriminator and action-specific fields.


  ## Type

  `list(ExOpenAI.Components.BetaComputerAction.t())`
  """
  @type t() :: list(ExOpenAI.Components.BetaComputerAction.t())
  @type input() :: list(ExOpenAI.Components.BetaComputerAction.input())
end
