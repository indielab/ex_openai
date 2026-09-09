defmodule ExOpenAI.Components.ModerationMode do
  @moduledoc """
  Module for representing the OpenAI schema ModerationMode.

  ## Type

  `:score | :block`

  ## Allowed Values

  `"score"`, `"block"`
  """
  @type t() :: :score | :block
  @type input() :: (:score | :block) | String.t()
end
