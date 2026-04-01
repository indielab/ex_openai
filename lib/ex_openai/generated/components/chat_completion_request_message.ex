defmodule ExOpenAI.Components.ChatCompletionRequestMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatCompletionRequestMessage.

  ## Type

  `ExOpenAI.Components.ChatCompletionRequestDeveloperMessage.t() | ExOpenAI.Components.ChatCompletionRequestSystemMessage.t() | ExOpenAI.Components.ChatCompletionRequestUserMessage.t() | ExOpenAI.Components.ChatCompletionRequestAssistantMessage.t() | ExOpenAI.Components.ChatCompletionRequestToolMessage.t() | ExOpenAI.Components.ChatCompletionRequestFunctionMessage.t()`
  """
  @type t() ::
          ((((ExOpenAI.Components.ChatCompletionRequestDeveloperMessage.t()
              | ExOpenAI.Components.ChatCompletionRequestSystemMessage.t())
             | ExOpenAI.Components.ChatCompletionRequestUserMessage.t())
            | ExOpenAI.Components.ChatCompletionRequestAssistantMessage.t())
           | ExOpenAI.Components.ChatCompletionRequestToolMessage.t())
          | ExOpenAI.Components.ChatCompletionRequestFunctionMessage.t()
end
