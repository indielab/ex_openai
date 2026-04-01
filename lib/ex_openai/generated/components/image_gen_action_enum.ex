defmodule ExOpenAI.Components.ImageGenActionEnum do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ImageGenActionEnum.

  ## Type

  `:generate | :edit | :auto`

  ## Allowed Values

  `"generate"`, `"edit"`, `"auto"`
  """
  @type t() :: (:generate | :edit) | :auto
end
