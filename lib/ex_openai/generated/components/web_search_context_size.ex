defmodule ExOpenAI.Components.WebSearchContextSize do
  use ExOpenAI.Jason

  @moduledoc """
  High level guidance for the amount of context window space to use for the 
  search. One of `low`, `medium`, or `high`. `medium` is the default.


  ## Type

  `:low | :medium | :high`

  ## Allowed Values

  `"low"`, `"medium"`, `"high"`
  """
  @type t() :: (:low | :medium) | :high
end
