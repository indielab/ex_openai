defmodule ExOpenAI.Components.ChatCompletionRequestAssistantMessageContentPart do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestAssistantMessageContentPart.

  ## Type

  `ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t() | ExOpenAI.Components.ChatCompletionRequestMessageContentPartRefusal.t()`
  """
  @type t() ::
          ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()
          | ExOpenAI.Components.ChatCompletionRequestMessageContentPartRefusal.t()
end
