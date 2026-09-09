defmodule ExOpenAI.Components.ClickButtonType do
  @moduledoc """
  Module for representing the OpenAI schema ClickButtonType.

  ## Type

  `:left | :right | :wheel | :back | :forward`

  ## Allowed Values

  `"left"`, `"right"`, `"wheel"`, `"back"`, `"forward"`
  """
  @type t() :: (((:left | :right) | :wheel) | :back) | :forward
  @type input() :: ((((:left | :right) | :wheel) | :back) | :forward) | String.t()
end
