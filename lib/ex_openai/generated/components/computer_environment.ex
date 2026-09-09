defmodule ExOpenAI.Components.ComputerEnvironment do
  @moduledoc """
  Module for representing the OpenAI schema ComputerEnvironment.

  ## Type

  `:windows | :mac | :linux | :ubuntu | :browser`

  ## Allowed Values

  `"windows"`, `"mac"`, `"linux"`, `"ubuntu"`, `"browser"`
  """
  @type t() :: (((:windows | :mac) | :linux) | :ubuntu) | :browser
  @type input() :: ((((:windows | :mac) | :linux) | :ubuntu) | :browser) | String.t()
end
