defmodule ExOpenAI.Components.ReasoningModeEnum do
  @moduledoc """
  Module for representing the OpenAI schema ReasoningModeEnum.

  ## Type

  `String.t() | :standard | :pro`
  """
  @type t() :: String.t() | :standard | :pro
  @type input() :: String.t() | (:standard | :pro) | String.t()
end
