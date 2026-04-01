defmodule ExOpenAI.Components.RankingOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema RankingOptions.

  ## Fields

  * `:hybrid_search` - **optional** - `ExOpenAI.Components.HybridSearchOptions.t()`  
    Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.

  * `:ranker` - **optional** - `ExOpenAI.Components.RankerVersionType.t()`  
    The ranker to use for the file search.

  * `:score_threshold` - **optional** - `number()`  
    The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          hybrid_search: ExOpenAI.Components.HybridSearchOptions.t() | nil,
          ranker: ExOpenAI.Components.RankerVersionType.t() | nil,
          score_threshold: number() | nil
        }
  defstruct [:hybrid_search, :ranker, :score_threshold]
end
