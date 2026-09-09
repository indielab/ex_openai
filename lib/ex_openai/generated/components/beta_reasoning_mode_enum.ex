defmodule ExOpenAI.Components.BetaReasoningModeEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaReasoningModeEnum.

  ## Type

  `String.t() | :standard | :pro`
  """
  @type t() :: String.t() | :standard | :pro
  @type input() :: String.t() | (:standard | :pro) | String.t()
end
