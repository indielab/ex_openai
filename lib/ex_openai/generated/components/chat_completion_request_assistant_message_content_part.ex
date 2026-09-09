defmodule ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart do
  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestAssistantMessageContentPart.

  ## Type

  `ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t() | ExOpenAI.Components.ChatCompletionRequestMessageContentPartRefusal.t()`
  """
  @type t() ::
          ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()
          | ExOpenAI.Components.ChatCompletionRequestMessageContentPartRefusal.t()
  @type input() ::
          ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.input()
          | ExOpenAI.Components.ChatCompletionRequestMessageContentPartRefusal.input()
end
