defmodule ExOpenAI.Components.ApplyPatchCallOutputStatus do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema ApplyPatchCallOutputStatus.

  ## Type

  `:completed | :failed`

  ## Allowed Values

  `"completed"`, `"failed"`
  """
  @type t() :: :completed | :failed
end
