defmodule ExOpenAI.Components.BetaModerationInputType do
  @moduledoc """
  Module for representing the OpenAI schema BetaModerationInputType.

  ## Type

  `:text | :image`

  ## Allowed Values

  `"text"`, `"image"`
  """
  @type t() :: :text | :image
  @type input() :: (:text | :image) | String.t()
end
