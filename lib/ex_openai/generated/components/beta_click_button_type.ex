defmodule ExOpenAI.Components.BetaClickButtonType do
  @moduledoc """
  Module for representing the OpenAI schema BetaClickButtonType.

  ## Type

  `:left | :right | :wheel | :back | :forward`

  ## Allowed Values

  `"left"`, `"right"`, `"wheel"`, `"back"`, `"forward"`
  """
  @type t() :: (((:left | :right) | :wheel) | :back) | :forward
  @type input() :: ((((:left | :right) | :wheel) | :back) | :forward) | String.t()
end
