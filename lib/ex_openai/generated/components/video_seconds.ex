defmodule ExOpenAI.Components.VideoSeconds do
  @moduledoc """
  Module for representing the OpenAI schema VideoSeconds.

  ## Type

  `:"4" | :"8" | :"12"`

  ## Allowed Values

  `"4"`, `"8"`, `"12"`
  """
  @type t() :: (:"4" | :"8") | :"12"
  @type input() :: ((:"4" | :"8") | :"12") | String.t()
end
