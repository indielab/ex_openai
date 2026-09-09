defmodule ExOpenAI.Components.BetaWebSearchActionSearch do
  use ExOpenAI.Jason

  @moduledoc """
  Action type "search" - Performs a web search query.


  ## Fields

  * `:queries` - **optional** - `list(String.t())`
    The search queries.

  * `:query` - **optional** - `String.t()`
    The search query.

  * `:sources` - **optional** - `list(%{required(:type) => :url, required(:url) => String.t()})`
    The sources used in the search.

  * `:type` - **required** - `:search`
    The action type.
    Allowed values: `"search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          queries: list(String.t()) | nil,
          query: String.t() | nil,
          sources: list(%{required(:type) => :url, required(:url) => String.t()}) | nil,
          type: :search
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:queries) => list(String.t()),
              optional(:query) => String.t(),
              optional(:sources) =>
                list(%{required(:type) => :url | String.t(), required(:url) => String.t()}),
              required(:type) => :search | String.t()
            }
  defstruct [:queries, :query, :sources, :type]
end
