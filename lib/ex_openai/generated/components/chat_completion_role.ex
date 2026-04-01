defmodule ExOpenAI.Components.ChatCompletionRole do
  use ExOpenAI.Jason

  @moduledoc """
  The role of the author of a message

  ## Type

  `:developer | :system | :user | :assistant | :tool | :function`

  ## Allowed Values

  `"developer"`, `"system"`, `"user"`, `"assistant"`, `"tool"`, `"function"`
  """
  @type t() :: ((((:developer | :system) | :user) | :assistant) | :tool) | :function
end
