defmodule ExOpenAI.Components.DetailEnum do
  @moduledoc """
  Module for representing the OpenAI schema DetailEnum.

  ## Type

  `:low | :high | :auto | :original`

  ## Allowed Values

  `"low"`, `"high"`, `"auto"`, `"original"`
  """
  @type t() :: ((:low | :high) | :auto) | :original
  @type input() :: (((:low | :high) | :auto) | :original) | String.t()
end
