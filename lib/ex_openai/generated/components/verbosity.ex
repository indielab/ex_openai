defmodule ExOpenAI.Components.Verbosity do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema Verbosity.

  ## Type

  `:low | :medium | :high | any()`
  """
  @type t() :: ((:low | :medium) | :high) | any()
end
