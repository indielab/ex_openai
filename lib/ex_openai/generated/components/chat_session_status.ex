defmodule ExOpenAI.Components.ChatSessionStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ChatSessionStatus.

  ## Type

  `:active | :expired | :cancelled`

  ## Allowed Values

  `"active"`, `"expired"`, `"cancelled"`
  """
  @type t() :: (:active | :expired) | :cancelled
end
