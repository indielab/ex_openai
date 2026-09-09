defmodule ExOpenAI.Components.Verbosity do
  @moduledoc """
  Module for representing the OpenAI schema Verbosity.

  ## Type

  `:low | :medium | :high | nil`
  """
  @type t() :: ((:low | :medium) | :high) | nil
  @type input() :: (((:low | :medium) | :high) | String.t()) | nil
end
