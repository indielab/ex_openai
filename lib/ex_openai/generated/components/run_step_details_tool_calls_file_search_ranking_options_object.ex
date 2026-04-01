defmodule ExOpenAI.Components.RunStepDetailsToolCallsFileSearchRankingOptionsObject do
  use ExOpenAI.Jason

  @moduledoc """
  The ranking options for the file search.

  ## Fields

  * `:ranker` - **required** - `ExOpenAI.Components.FileSearchRanker.t()`

  * `:score_threshold` - **required** - `number()`  
    The score threshold for the file search. All values must be a floating point number between 0 and 1.  
    Constraints: minimum: 0, maximum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          ranker: ExOpenAI.Components.FileSearchRanker.t(),
          score_threshold: number()
        }
  defstruct [:ranker, :score_threshold]
end
