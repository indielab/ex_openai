defmodule ExOpenAI.Components.BetaRankerVersionType do
  @moduledoc """
  Module for representing the OpenAI schema BetaRankerVersionType.

  ## Type

  `:auto | :"default-2024-11-15"`

  ## Allowed Values

  `"auto"`, `"default-2024-11-15"`
  """
  @type t() :: :auto | :"default-2024-11-15"
  @type input() :: (:auto | :"default-2024-11-15") | String.t()
end
