defmodule ExOpenAI.Components.ClickButtonType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ClickButtonType.

  ## Type

  `:left | :right | :wheel | :back | :forward`

  ## Allowed Values

  `"left"`, `"right"`, `"wheel"`, `"back"`, `"forward"`
  """
  @type t() :: (((:left | :right) | :wheel) | :back) | :forward
end
