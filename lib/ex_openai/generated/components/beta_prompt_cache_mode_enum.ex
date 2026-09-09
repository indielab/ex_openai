defmodule ExOpenAI.Components.BetaPromptCacheModeEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaPromptCacheModeEnum.

  ## Type

  `:implicit | :explicit`

  ## Allowed Values

  `"implicit"`, `"explicit"`
  """
  @type t() :: :implicit | :explicit
  @type input() :: (:implicit | :explicit) | String.t()
end
