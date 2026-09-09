defmodule ExOpenAI.Components.PromptCacheModeEnum do
  @moduledoc """
  Module for representing the OpenAI schema PromptCacheModeEnum.

  ## Type

  `:implicit | :explicit`

  ## Allowed Values

  `"implicit"`, `"explicit"`
  """
  @type t() :: :implicit | :explicit
  @type input() :: (:implicit | :explicit) | String.t()
end
