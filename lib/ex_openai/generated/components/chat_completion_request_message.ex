defmodule ExOpenAI.Components.ChatCompletionRequestMessage do
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
  @type input() ::
          ((((ExOpenAI.Components.ChatCompletionRequestDeveloperMessage.input()
              | ExOpenAI.Components.ChatCompletionRequestSystemMessage.input())
             | ExOpenAI.Components.ChatCompletionRequestUserMessage.input())
            | ExOpenAI.Components.ChatCompletionRequestAssistantMessage.input())
           | ExOpenAI.Components.ChatCompletionRequestToolMessage.input())
          | ExOpenAI.Components.ChatCompletionRequestFunctionMessage.input()
end
