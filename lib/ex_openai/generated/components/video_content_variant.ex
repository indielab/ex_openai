defmodule ExOpenAI.Components.VideoContentVariant do
  @moduledoc """
  Module for representing the OpenAI schema VideoContentVariant.

  ## Type

  `:video | :thumbnail | :spritesheet`

  ## Allowed Values

  `"video"`, `"thumbnail"`, `"spritesheet"`
  """
  @type t() :: (:video | :thumbnail) | :spritesheet
  @type input() :: ((:video | :thumbnail) | :spritesheet) | String.t()
end
