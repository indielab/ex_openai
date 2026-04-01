defmodule ExOpenAI.Components.VideoContentVariant do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VideoContentVariant.

  ## Type

  `:video | :thumbnail | :spritesheet`

  ## Allowed Values

  `"video"`, `"thumbnail"`, `"spritesheet"`
  """
  @type t() :: (:video | :thumbnail) | :spritesheet
end
