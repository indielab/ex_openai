defmodule ExOpenAI.Components.VectorStoreSearchResultsPage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema VectorStoreSearchResultsPage.

  ## Fields

  * `:data` - **required** - `[ExOpenAI.Components.VectorStoreSearchResultItem.t()]`  
    The list of search result items.

  * `:has_more` - **required** - `boolean()`  
    Indicates if there are more results to fetch.

  * `:next_page` - **required** - `String.t() | any()`

  * `:object` - **required** - `:"vector_store.search_results.page"`  
    The object type, which is always `vector_store.search_results.page`  
    Allowed values: `"vector_store.search_results.page"`

  * `:search_query` - **required** - `[String.t()]`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          data: list(ExOpenAI.Components.VectorStoreSearchResultItem.t()),
          has_more: boolean(),
          next_page: String.t() | any(),
          object: :"vector_store.search_results.page",
          search_query: list(String.t())
        }
  defstruct [:data, :has_more, :next_page, :object, :search_query]
end
