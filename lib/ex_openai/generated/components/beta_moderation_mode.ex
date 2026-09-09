defmodule ExOpenAI.Components.BetaModerationMode do
  @moduledoc """
  Module for representing the OpenAI schema BetaModerationMode.

  ## Type

  `:score | :block`

  ## Allowed Values

  `"score"`, `"block"`
  """
  @type t() :: :score | :block
  @type input() :: (:score | :block) | String.t()
end
