defmodule ExOpenAI.Components.ChatSessionStatus do
  @moduledoc """
  Module for representing the OpenAI schema ChatSessionStatus.

  ## Type

  `:active | :expired | :cancelled`

  ## Allowed Values

  `"active"`, `"expired"`, `"cancelled"`
  """
  @type t() :: (:active | :expired) | :cancelled
  @type input() :: ((:active | :expired) | :cancelled) | String.t()
end
