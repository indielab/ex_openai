defmodule ExOpenAI.Components.BetaPersonalityEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaPersonalityEnum.

  ## Type

  `String.t() | :friendly | :pragmatic`
  """
  @type t() :: String.t() | :friendly | :pragmatic
  @type input() :: String.t() | (:friendly | :pragmatic) | String.t()
end
