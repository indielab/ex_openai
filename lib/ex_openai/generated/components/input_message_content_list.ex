defmodule ExOpenAI.Components.InputMessageContentList do
  use ExOpenAI.Jason

  @moduledoc """
  A list of one or many input items to the model, containing different content 
  types.


  ## Type

  `[ExOpenAI.Components.InputContent.t()]`
  """
  @type t() :: list(ExOpenAI.Components.InputContent.t())
end
