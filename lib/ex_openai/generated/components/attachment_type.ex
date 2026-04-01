defmodule ExOpenAI.Components.AttachmentType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AttachmentType.

  ## Type

  `:image | :file`

  ## Allowed Values

  `"image"`, `"file"`
  """
  @type t() :: :image | :file
end
