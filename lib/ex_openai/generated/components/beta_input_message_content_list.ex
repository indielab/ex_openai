defmodule ExOpenAI.Components.BetaInputMessageContentList do
  @moduledoc """
  A list of one or many input items to the model, containing different content
  types.


  ## Type

  `list(ExOpenAI.Components.BetaInputContent.t())`
  """
  @type t() :: list(ExOpenAI.Components.BetaInputContent.t())
  @type input() :: list(ExOpenAI.Components.BetaInputContent.input())
end
