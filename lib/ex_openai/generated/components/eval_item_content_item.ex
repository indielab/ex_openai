defmodule ExOpenAI.Components.EvalItemContentItem do
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
  @type input() ::
          (((ExOpenAI.Components.EvalItemContentText.input()
             | ExOpenAI.Components.InputTextContent.input())
            | ExOpenAI.Components.EvalItemContentOutputText.input())
           | ExOpenAI.Components.EvalItemInputImage.input())
          | ExOpenAI.Components.InputAudio.input()
end
