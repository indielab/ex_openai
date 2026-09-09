defmodule ExOpenAI.Components.BetaVerbosity do
  @moduledoc """
  Module for representing the OpenAI schema BetaVerbosity.

  ## Type

  `:low | :medium | :high | nil`
  """
  @type t() :: ((:low | :medium) | :high) | nil
  @type input() :: (((:low | :medium) | :high) | String.t()) | nil
end
