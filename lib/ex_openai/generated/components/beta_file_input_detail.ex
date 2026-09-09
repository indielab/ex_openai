defmodule ExOpenAI.Components.BetaFileInputDetail do
  @moduledoc """
  Module for representing the OpenAI schema BetaFileInputDetail.

  ## Type

  `:auto | :low | :high`

  ## Allowed Values

  `"auto"`, `"low"`, `"high"`
  """
  @type t() :: (:auto | :low) | :high
  @type input() :: ((:auto | :low) | :high) | String.t()
end
