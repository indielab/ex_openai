defmodule ExOpenAI.Components.BetaServiceTierEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaServiceTierEnum.

  ## Type

  `:auto | :default | :fast | :flex | :priority`

  ## Allowed Values

  `"auto"`, `"default"`, `"fast"`, `"flex"`, `"priority"`
  """
  @type t() :: (((:auto | :default) | :fast) | :flex) | :priority
  @type input() :: ((((:auto | :default) | :fast) | :flex) | :priority) | String.t()
end
