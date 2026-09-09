defmodule ExOpenAI.Components.BetaComputerEnvironment do
  @moduledoc """
  Module for representing the OpenAI schema BetaComputerEnvironment.

  ## Type

  `:windows | :mac | :linux | :ubuntu | :browser`

  ## Allowed Values

  `"windows"`, `"mac"`, `"linux"`, `"ubuntu"`, `"browser"`
  """
  @type t() :: (((:windows | :mac) | :linux) | :ubuntu) | :browser
  @type input() :: ((((:windows | :mac) | :linux) | :ubuntu) | :browser) | String.t()
end
