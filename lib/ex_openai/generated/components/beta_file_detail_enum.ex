defmodule ExOpenAI.Components.BetaFileDetailEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaFileDetailEnum.

  ## Type

  `:auto | :low | :high`

  ## Allowed Values

  `"auto"`, `"low"`, `"high"`
  """
  @type t() :: (:auto | :low) | :high
  @type input() :: ((:auto | :low) | :high) | String.t()
end
