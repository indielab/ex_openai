defmodule ExOpenAI.Components.ChatCompletionRole do
  @moduledoc """
  The role of the author of a message

  ## Type

  `:developer | :system | :user | :assistant | :tool | :function`

  ## Allowed Values

  `"developer"`, `"system"`, `"user"`, `"assistant"`, `"tool"`, `"function"`
  """
  @type t() :: ((((:developer | :system) | :user) | :assistant) | :tool) | :function
  @type input() ::
          (((((:developer | :system) | :user) | :assistant) | :tool) | :function) | String.t()
end
