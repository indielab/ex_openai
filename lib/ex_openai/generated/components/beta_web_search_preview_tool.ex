defmodule ExOpenAI.Components.BetaWebSearchPreviewTool do
  use ExOpenAI.Jason

  @moduledoc """
  This tool searches the web for relevant results to use in a response. Learn more about the [web search tool](https://platform.openai.com/docs/guides/tools-web-search).

  ## Fields

  * `:search_content_types` - **optional** - `list(ExOpenAI.Components.BetaSearchContentType.t())`

  * `:search_context_size` - **optional** - `ExOpenAI.Components.BetaSearchContextSize.t()`
    High level guidance for the amount of context window space to use for the search. One of `low`, `medium`, or `high`. `medium` is the default.

  * `:type` - **required** - `:web_search_preview | :web_search_preview_2025_03_11`
    The type of the web search tool. One of `web_search_preview` or `web_search_preview_2025_03_11`.
    Allowed values: `"web_search_preview"`, `"web_search_preview_2025_03_11"`
    Default: `"web_search_preview"`

  * `:user_location` - **optional** - `ExOpenAI.Components.BetaApproximateLocation.t() | nil`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          search_content_types: list(ExOpenAI.Components.BetaSearchContentType.t()) | nil,
          search_context_size: ExOpenAI.Components.BetaSearchContextSize.t() | nil,
          type: :web_search_preview | :web_search_preview_2025_03_11,
          user_location: (ExOpenAI.Components.BetaApproximateLocation.t() | nil) | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:search_content_types) =>
                list(ExOpenAI.Components.BetaSearchContentType.input()),
              optional(:search_context_size) => ExOpenAI.Components.BetaSearchContextSize.input(),
              required(:type) =>
                (:web_search_preview | :web_search_preview_2025_03_11) | String.t(),
              optional(:user_location) =>
                ExOpenAI.Components.BetaApproximateLocation.input() | nil
            }
  defstruct [:search_content_types, :search_context_size, :type, :user_location]
end
