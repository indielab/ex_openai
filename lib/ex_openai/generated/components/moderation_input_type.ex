defmodule ExOpenAI.Components.ModerationInputType do
  @moduledoc """
  Module for representing the OpenAI schema ModerationInputType.

  ## Type

  `:text | :image`

  ## Allowed Values

  `"text"`, `"image"`
  """
  @type t() :: :text | :image
  @type input() :: (:text | :image) | String.t()
end
