defmodule ExOpenAI.Components.BetaRankingOptions do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaRankingOptions.

  ## Fields

  * `:hybrid_search` - **optional** - `ExOpenAI.Components.BetaHybridSearchOptions.t()`
    Weights that control how reciprocal rank fusion balances semantic embedding matches versus sparse keyword matches when hybrid search is enabled.

  * `:ranker` - **optional** - `ExOpenAI.Components.BetaRankerVersionType.t()`
    The ranker to use for the file search.

  * `:score_threshold` - **optional** - `number()`
    The score threshold for the file search, a number between 0 and 1. Numbers closer to 1 will attempt to return only the most relevant results, but may return fewer results.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          hybrid_search: ExOpenAI.Components.BetaHybridSearchOptions.t() | nil,
          ranker: ExOpenAI.Components.BetaRankerVersionType.t() | nil,
          score_threshold: number() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:hybrid_search) => ExOpenAI.Components.BetaHybridSearchOptions.input(),
              optional(:ranker) => ExOpenAI.Components.BetaRankerVersionType.input(),
              optional(:score_threshold) => number()
            }
  defstruct [:hybrid_search, :ranker, :score_threshold]
end
