defmodule ExOpenAI.Components.BetaPromptCacheRetentionEnum do
  @moduledoc """
  Module for representing the OpenAI schema BetaPromptCacheRetentionEnum.

  ## Type

  `:in_memory | :"24h"`

  ## Allowed Values

  `"in_memory"`, `"24h"`
  """
  @type t() :: :in_memory | :"24h"
  @type input() :: (:in_memory | :"24h") | String.t()
end
