defmodule ExOpenAI.Components.ChatCompletionRequestUserMessageContentPart do
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
  @type input() ::
          ((ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.input()
            | ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage.input())
           | ExOpenAI.Components.ChatCompletionRequestMessageContentPartAudio.input())
          | ExOpenAI.Components.ChatCompletionRequestMessageContentPartFile.input()
end
