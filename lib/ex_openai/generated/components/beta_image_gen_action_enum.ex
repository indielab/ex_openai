defmodule ExOpenAI.Components.BetaImageGenActionEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaImageGenActionEnum.

  ## Type

  `:generate | :edit | :auto`

  ## Allowed Values

  `"generate"`, `"edit"`, `"auto"`
  """
  @type t() :: (:generate | :edit) | :auto
  @type input() :: ((:generate | :edit) | :auto) | String.t()
end
