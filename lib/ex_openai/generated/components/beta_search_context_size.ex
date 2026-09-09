defmodule ExOpenAI.Components.BetaSearchContextSize do
  @moduledoc """
  Module for representing the OpenAI schema BetaSearchContextSize.

  ## Type

  `:low | :medium | :high`

  ## Allowed Values

  `"low"`, `"medium"`, `"high"`
  """
  @type t() :: (:low | :medium) | :high
  @type input() :: ((:low | :medium) | :high) | String.t()
end
