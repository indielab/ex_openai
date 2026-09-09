defmodule ExOpenAI.Components.FileSearchRanker do
  @moduledoc """
  The ranker to use for the file search. If not specified will use the `auto` ranker.

  ## Type

  `:auto | :default_2024_08_21`

  ## Allowed Values

  `"auto"`, `"default_2024_08_21"`
  """
  @type t() :: :auto | :default_2024_08_21
  @type input() :: (:auto | :default_2024_08_21) | String.t()
end
