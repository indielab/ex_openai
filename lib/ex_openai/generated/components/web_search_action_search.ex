defmodule ExOpenAI.Components.WebSearchActionSearch do
  use ExOpenAI.Jason

  @moduledoc """
  Action type "search" - Performs a web search query.


  ## Fields

  * `:queries` - **optional** - `[String.t()]`  
    The search queries.

  * `:query` - **required** - `String.t()`  
    [DEPRECATED] The search query.

  * `:sources` - **optional** - `[{:%{}, [], [{{:required, [], [:type]}, :url}, {{:required, [], [:url]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]`  
    The sources used in the search.

  * `:type` - **required** - `:search`  
    The action type.  
    Allowed values: `"search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          queries: list(String.t()) | nil,
          query: String.t(),
          sources: list(%{required(:type) => :url, required(:url) => String.t()}) | nil,
          type: :search
        }
  defstruct [:queries, :query, :sources, :type]
end
