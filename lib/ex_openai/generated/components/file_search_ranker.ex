defmodule ExOpenAI.Components.FileSearchRanker do
  use ExOpenAI.Jason

  @moduledoc """
  The ranker to use for the file search. If not specified will use the `auto` ranker.

  ## Type

  `:auto | :default_2024_08_21`

  ## Allowed Values

  `"auto"`, `"default_2024_08_21"`
  """
  @type t() :: :auto | :default_2024_08_21
end
