defmodule ExOpenAI.Components.ComputerActionList do
  @moduledoc """
  Flattened batched actions for `computer_use`. Each action includes an
  `type` discriminator and action-specific fields.


  ## Type

  `list(ExOpenAI.Components.ComputerAction.t())`
  """
  @type t() :: list(ExOpenAI.Components.ComputerAction.t())
  @type input() :: list(ExOpenAI.Components.ComputerAction.input())
end
