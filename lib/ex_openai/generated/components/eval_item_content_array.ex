defmodule ExOpenAI.Components.EvalItemContentArray do
  @moduledoc """
  A list of inputs, each of which may be either an input text, output text, input
  image, or input audio object.


  ## Type

  `list(ExOpenAI.Components.EvalItemContentItem.t())`
  """
  @type t() :: list(ExOpenAI.Components.EvalItemContentItem.t())
  @type input() :: list(ExOpenAI.Components.EvalItemContentItem.input())
end
