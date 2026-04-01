defmodule ExOpenAI.Components.EvalItemContent do
  use ExOpenAI.Jason

  @moduledoc """
  Inputs to the model - can contain template strings. Supports text, output text, input images, and input audio, either as a single item or an array of items.


  ## Type

  `ExOpenAI.Components.EvalItemContentItem.t() | ExOpenAI.Components.EvalItemContentArray.t()`
  """
  @type t() ::
          ExOpenAI.Components.EvalItemContentItem.t()
          | ExOpenAI.Components.EvalItemContentArray.t()
end
