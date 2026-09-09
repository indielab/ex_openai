defmodule ExOpenAI.Components.AssistantToolsFileSearch do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema AssistantToolsFileSearch.

  ## Fields

  * `:file_search` - **optional** - `%{ optional(:max_num_results) => integer(), optional(:ranking_options) => ExOpenAI.Components.FileSearchRankingOptions.t() }`
    Overrides for the file search tool.

  * `:type` - **required** - `:file_search`
    The type of tool being defined: `file_search`
    Allowed values: `"file_search"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_search:
            %{
              optional(:max_num_results) => integer(),
              optional(:ranking_options) => ExOpenAI.Components.FileSearchRankingOptions.t()
            }
            | nil,
          type: :file_search
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:file_search) => %{
                optional(:max_num_results) => integer(),
                optional(:ranking_options) => ExOpenAI.Components.FileSearchRankingOptions.input()
              },
              required(:type) => :file_search | String.t()
            }
  defstruct [:file_search, :type]
end
