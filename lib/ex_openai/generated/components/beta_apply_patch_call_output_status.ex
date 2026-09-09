defmodule ExOpenAI.Components.BetaApplyPatchCallOutputStatus do
  @moduledoc """
  Module for representing the OpenAI schema BetaApplyPatchCallOutputStatus.

  ## Type

  `:completed | :failed`

  ## Allowed Values

  `"completed"`, `"failed"`
  """
  @type t() :: :completed | :failed
  @type input() :: (:completed | :failed) | String.t()
end
