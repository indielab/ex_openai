defmodule ExOpenAI.Components.FileSearchRankingOptions do
  use ExOpenAI.Jason

  @moduledoc """
  The ranking options for the file search. If not specified, the file search tool will use the `auto` ranker and a score_threshold of 0.

  See the [file search tool documentation](/docs/assistants/tools/file-search#customizing-file-search-settings) for more information.


  ## Fields

  * `:ranker` - **optional** - `ExOpenAI.Components.FileSearchRanker.t()`

  * `:score_threshold` - **required** - `number()`  
    The score threshold for the file search. All values must be a floating point number between 0 and 1.  
    Constraints: minimum: 0, maximum: 1
  """
  @type t() :: %{
          __struct__: __MODULE__,
          ranker: ExOpenAI.Components.FileSearchRanker.t() | nil,
          score_threshold: number()
        }
  defstruct [:ranker, :score_threshold]
end
