defmodule ExOpenAI.Components.EvalItemContentItem do
  use ExOpenAI.Jason

  @moduledoc """
  A single content item: input text, output text, input image, or input audio.


  ## Type

  `ExOpenAI.Components.EvalItemContentText.t() | ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.EvalItemContentOutputText.t() | ExOpenAI.Components.EvalItemInputImage.t() | ExOpenAI.Components.InputAudio.t()`
  """
  @type t() ::
          (((ExOpenAI.Components.EvalItemContentText.t()
             | ExOpenAI.Components.InputTextContent.t())
            | ExOpenAI.Components.EvalItemContentOutputText.t())
           | ExOpenAI.Components.EvalItemInputImage.t())
          | ExOpenAI.Components.InputAudio.t()
end
