defmodule ExOpenAI.Components.SearchContentType do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SearchContentType.

  ## Type

  `:text | :image`

  ## Allowed Values

  `"text"`, `"image"`
  """
  @type t() :: :text | :image
end
