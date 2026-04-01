defmodule ExOpenAI.Components.ComputerEnvironment do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ComputerEnvironment.

  ## Type

  `:windows | :mac | :linux | :ubuntu | :browser`

  ## Allowed Values

  `"windows"`, `"mac"`, `"linux"`, `"ubuntu"`, `"browser"`
  """
  @type t() :: (((:windows | :mac) | :linux) | :ubuntu) | :browser
end
