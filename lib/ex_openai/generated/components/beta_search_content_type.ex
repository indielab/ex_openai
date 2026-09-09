defmodule ExOpenAI.Components.BetaSearchContentType do
  @moduledoc """
  Module for representing the OpenAI schema BetaSearchContentType.

  ## Type

  `:text | :image`

  ## Allowed Values

  `"text"`, `"image"`
  """
  @type t() :: :text | :image
  @type input() :: (:text | :image) | String.t()
end
