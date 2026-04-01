defmodule ExOpenAI.Components.ChatCompletionRequestSystemMessageContentPart do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestSystemMessageContentPart.

  ## Type

  `ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()`
  """
  @type t() :: ExOpenAI.Components.ChatCompletionRequestMessageContentPartText.t()
end
