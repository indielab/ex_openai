defmodule ExOpenAI.Components.AttachmentType do
  @moduledoc """
  Module for representing the OpenAI schema AttachmentType.

  ## Type

  `:image | :file`

  ## Allowed Values

  `"image"`, `"file"`
  """
  @type t() :: :image | :file
  @type input() :: (:image | :file) | String.t()
end
