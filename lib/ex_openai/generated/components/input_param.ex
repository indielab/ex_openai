defmodule ExOpenAI.Components.InputParam do
  use ExOpenAI.Jason

  @moduledoc """
  Text, image, or file inputs to the model, used to generate a response.

  Learn more:
  - [Text inputs and outputs](/docs/guides/text)
  - [Image inputs](/docs/guides/images)
  - [File inputs](/docs/guides/pdf-files)
  - [Conversation state](/docs/guides/conversation-state)
  - [Function calling](/docs/guides/function-calling)


  ## Type

  `String.t() | [ExOpenAI.Components.InputItem.t()]`
  """
  @type t() :: String.t() | list(ExOpenAI.Components.InputItem.t())
end
