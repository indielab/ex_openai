defmodule ExOpenAI.Components.InputParam do
  @moduledoc """
  Text, image, or file inputs to the model, used to generate a response.

  Learn more:
  - [Text inputs and outputs](https://platform.openai.com/docs/guides/text)
  - [Image inputs](https://platform.openai.com/docs/guides/images)
  - [File inputs](https://platform.openai.com/docs/guides/pdf-files)
  - [Conversation state](https://platform.openai.com/docs/guides/conversation-state)
  - [Function calling](https://platform.openai.com/docs/guides/function-calling)


  ## Type

  `String.t() | list(ExOpenAI.Components.InputItem.t())`
  """
  @type t() :: String.t() | list(ExOpenAI.Components.InputItem.t())
  @type input() :: String.t() | list(ExOpenAI.Components.InputItem.input())
end
