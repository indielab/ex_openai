defmodule ExOpenAI.Components.ApplyPatchCallOutputStatus do
  @moduledoc """
  Module for representing the OpenAI schema ApplyPatchCallOutputStatus.

  ## Type

  `:completed | :failed`

  ## Allowed Values

  `"completed"`, `"failed"`
  """
  @type t() :: :completed | :failed
  @type input() :: (:completed | :failed) | String.t()
end
