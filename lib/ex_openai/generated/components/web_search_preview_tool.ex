defmodule ExOpenAI.Components.WebSearchPreviewTool do
  use ExOpenAI.Jason

  @moduledoc """
  This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).

  ## Fields

  * `:search_content_types` - **optional** - `[ExOpenAI.Components.SearchContentType.t()]`

  * `:search_context_size` - **optional** - `ExOpenAI.Components.SearchContextSize.t()`  
    High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.

  * `:type` - **required** - `:web_search_preview | :web_search_preview_2025_03_11`  
    The type of the web search tool. One of `web_search_preview` or `web_search_preview_2025_03_11`.  
    Allowed values: `"web_search_preview"`, `"web_search_preview_2025_03_11"`  
    Default: `"web_search_preview"`

  * `:user_location` - **optional** - `ExOpenAI.Components.ApproximateLocation.t() | any()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          search_content_types: list(ExOpenAI.Components.SearchContentType.t()) | nil,
          search_context_size: ExOpenAI.Components.SearchContextSize.t() | nil,
          type: :web_search_preview | :web_search_preview_2025_03_11,
          user_location: (ExOpenAI.Components.ApproximateLocation.t() | any()) | nil
        }
  defstruct [:search_content_types, :search_context_size, :type, :user_location]
end
