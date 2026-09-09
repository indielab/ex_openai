defmodule ExOpenAI.Components.SearchContentType do
  @moduledoc """
  Module for representing the OpenAI schema SearchContentType.

  ## Type

  `:text | :image`

  ## Allowed Values

  `"text"`, `"image"`
  """
  @type t() :: :text | :image
  @type input() :: (:text | :image) | String.t()
end
