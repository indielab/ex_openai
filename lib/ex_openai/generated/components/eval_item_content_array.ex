defmodule ExOpenAI.Components.EvalItemContentArray do
  use ExOpenAI.Jason

  @moduledoc """
  A list of inputs, each of which may be either an input text, output text, input
  image, or input audio object.


  ## Type

  `[ExOpenAI.Components.EvalItemContentItem.t()]`
  """
  @type t() :: list(ExOpenAI.Components.EvalItemContentItem.t())
end
