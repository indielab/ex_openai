defmodule ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestUserMessageContentPart.

  ## Type

  `ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t() | ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage.t() | ExOpenAI.Components.ChatCompletionRequestMessageContentPartAudio.t() | ExOpenAI.Components.ChatCompletionRequestMessageContentPartFile.t()`
  """
  @type t() ::
          ((ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()
            | ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage.t())
           | ExOpenAI.Components.ChatCompletionRequestMessageContentPartAudio.t())
          | ExOpenAI.Components.ChatCompletionRequestMessageContentPartFile.t()
end
