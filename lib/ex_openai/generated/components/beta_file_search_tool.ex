defmodule ExOpenAI.Components.BetaFileSearchTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that searches for relevant content from uploaded files. Learn more about the [file search tool](https://platform.openai.com/docs/guides/tools-file-search).

  ## Fields

  * `:filters` - **optional** - `ExOpenAI.Components.BetaFilters.t() | nil`

  * `:max_num_results` - **optional** - `integer()`
    The maximum number of results to return. This number should be between 1 and 50 inclusive.

  * `:ranking_options` - **optional** - `ExOpenAI.Components.BetaRankingOptions.t()`
    Ranking options for search.

  * `:type` - **required** - `:file_search`
    The type of the file search tool. Always `file_search`.
    Allowed values: `"file_search"`
    Default: `"file_search"`

  * `:vector_store_ids` - **required** - `list(String.t())`
    The IDs of the vector stores to search.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          filters: (ExOpenAI.Components.BetaFilters.t() | nil) | nil,
          max_num_results: integer() | nil,
          ranking_options: ExOpenAI.Components.BetaRankingOptions.t() | nil,
          type: :file_search,
          vector_store_ids: list(String.t())
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:filters) => ExOpenAI.Components.BetaFilters.input() | nil,
              optional(:max_num_results) => integer(),
              optional(:ranking_options) => ExOpenAI.Components.BetaRankingOptions.input(),
              required(:type) => :file_search | String.t(),
              required(:vector_store_ids) => list(String.t())
            }
  defstruct [:filters, :max_num_results, :ranking_options, :type, :vector_store_ids]
end
