defmodule ExOpenAI.Components.WebSearchTool do
  use ExOpenAI.Jason

  @moduledoc """
  Search the Internet for sources related to the prompt. Learn more about the
  [web search tool](https://platform.openai.com/docs/guides/tools-web-search).


  ## Fields

  * `:filters` - **optional** - `%{optional(:allowed_domains) => list(String.t()) | nil} | nil`

  * `:search_context_size` - **optional** - `:low | :medium | :high`
    High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.
    Allowed values: `"low"`, `"medium"`, `"high"`
    Default: `"medium"`

  * `:type` - **required** - `:web_search | :web_search_2025_08_26`
    The type of the web search tool. One of `web_search` or `web_search_2025_08_26`.
    Allowed values: `"web_search"`, `"web_search_2025_08_26"`
    Default: `"web_search"`

  * `:user_location` - **optional** - `ExOpenAI.Components.WebSearchApproximateLocation.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          filters: (%{optional(:allowed_domains) => list(String.t()) | nil} | nil) | nil,
          search_context_size: ((:low | :medium) | :high) | nil,
          type: :web_search | :web_search_2025_08_26,
          user_location: ExOpenAI.Components.WebSearchApproximateLocation.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:filters) => %{optional(:allowed_domains) => list(String.t()) | nil} | nil,
              optional(:search_context_size) => ((:low | :medium) | :high) | String.t(),
              required(:type) => (:web_search | :web_search_2025_08_26) | String.t(),
              optional(:user_location) => ExOpenAI.Components.WebSearchApproximateLocation.input()
            }
  defstruct [:filters, :search_context_size, :type, :user_location]
end
