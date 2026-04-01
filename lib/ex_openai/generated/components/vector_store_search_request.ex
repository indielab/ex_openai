defmodule ExOpenAI.Components.VectorStoreSearchRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VectorStoreSearchRequest.

  ## Fields

  * `:filters` - **optional** - `ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t()`  
    A filter to apply based on file attributes.

  * `:max_num_results` - **optional** - `integer()`  
    The maximum number of results to return. This number should be between 1 and 50 inclusive.  
    Default: `10`  
    Constraints: minimum: 1, maximum: 50

  * `:query` - **required** - `String.t() | [String.t()]`  
    A query string for a search

  * `:ranking_options` - **optional** - `{:%{}, [], [{{:optional, [], [:ranker]}, {:|, [], [{:|, [], [:none, :auto]}, :"default-2024-11-15"]}}, {{:optional, [], [:score_threshold]}, {:number, [], []}}]}`  
    Ranking options for search.

  * `:rewrite_query` - **optional** - `boolean()`  
    Whether to rewrite the natural language query for vector search.  
    Default: `false`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          filters:
            (ExOpenAI.Components.ComparisonFilter.t() | ExOpenAI.Components.CompoundFilter.t())
            | nil,
          max_num_results: integer() | nil,
          query: String.t() | list(String.t()),
          ranking_options:
            %{
              optional(:ranker) => (:none | :auto) | :"default-2024-11-15",
              optional(:score_threshold) => number()
            }
            | nil,
          rewrite_query: boolean() | nil
        }
  defstruct [:filters, :max_num_results, :query, :ranking_options, :rewrite_query]
end
