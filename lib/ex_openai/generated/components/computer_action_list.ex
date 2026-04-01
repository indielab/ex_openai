defmodule ExOpenAI.Components.ComputerActionList do
  use ExOpenAI.Jason

  @moduledoc """
  Flattened batched actions for `computer_use`. Each action includes an
  `type` discriminator and action-specific fields.


  ## Type

  `[ExOpenAI.Components.ComputerAction.t()]`
  """
  @type t() :: list(ExOpenAI.Components.ComputerAction.t())
end
