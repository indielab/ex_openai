defmodule ExOpenAI.Components.InputMessageContentList do
  @moduledoc """
  A list of one or many input items to the model, containing different content
  types.


  ## Type

  `list(ExOpenAI.Components.InputContent.t())`
  """
  @type t() :: list(ExOpenAI.Components.InputContent.t())
  @type input() :: list(ExOpenAI.Components.InputContent.input())
end
