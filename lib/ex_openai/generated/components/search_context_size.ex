defmodule ExOpenAI.Components.SearchContextSize do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema SearchContextSize.

  ## Type

  `:low | :medium | :high`

  ## Allowed Values

  `"low"`, `"medium"`, `"high"`
  """
  @type t() :: (:low | :medium) | :high
end
