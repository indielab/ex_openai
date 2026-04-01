defmodule ExOpenAI.Components.VideoSeconds do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VideoSeconds.

  ## Type

  `:"4" | :"8" | :"12"`

  ## Allowed Values

  `"4"`, `"8"`, `"12"`
  """
  @type t() :: (:"4" | :"8") | :"12"
end
