defmodule ExOpenAI.Components.BetaInputParam do
  @moduledoc """
  Text, image, or file inputs to the model, used to generate a response.

  Learn more:
  - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
  - [Image inputs](https://platform.openai.com/docs/guides/images)
  - [File inputs](https://platform.openai.com/docs/guides/pdf-files)
  - [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
  - [Function calling](https://platform.openai.com/docs/guides/function-calling)


  ## Type

  `String.t() | list(ExOpenAI.Components.BetaInputItem.t())`
  """
  @type t() :: String.t() | list(ExOpenAI.Components.BetaInputItem.t())
  @type input() :: String.t() | list(ExOpenAI.Components.BetaInputItem.input())
end
