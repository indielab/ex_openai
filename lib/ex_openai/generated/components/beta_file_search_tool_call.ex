defmodule ExOpenAI.Components.BetaFileSearchToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  The results of a file search tool call. See the
  [file search guide](https://platform.openai.com/docs/guides/tools-file-search) for more information.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:id` - **required** - `String.t()`
    The unique ID of the file search tool call.

  * `:queries` - **required** - `list(String.t())`
    The queries used to search for files.

  * `:results` - **optional** - `list(%{ optional(:attributes) => ExOpenAI.Components.BetaVectorStoreFileAttributes.t(), optional(:file_id) => String.t(), optional(:filename) => String.t(), optional(:score) => number(), optional(:text) => String.t() }) | nil`

  * `:status` - **required** - `:in_progress | :searching | :completed | :incomplete | :failed`
    The status of the file search tool call. One of `in_progress`,
  `searching`, `incomplete` or `failed`,
    Allowed values: `"in_progress"`, `"searching"`, `"completed"`, `"incomplete"`, `"failed"`

  * `:type` - **required** - `:file_search_call`
    The type of the file search tool call. Always `file_search_call`.
    Allowed values: `"file_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          id: String.t(),
          queries: list(String.t()),
          results:
            (list(%{
               optional(:attributes) => ExOpenAI.Components.BetaVectorStoreFileAttributes.t(),
               optional(:file_id) => String.t(),
               optional(:filename) => String.t(),
               optional(:score) => number(),
               optional(:text) => String.t()
             })
             | nil)
            | nil,
          status: (((:in_progress | :searching) | :completed) | :incomplete) | :failed,
          type: :file_search_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:id) => String.t(),
              required(:queries) => list(String.t()),
              optional(:results) =>
                list(%{
                  optional(:attributes) =>
                    ExOpenAI.Components.BetaVectorStoreFileAttributes.input(),
                  optional(:file_id) => String.t(),
                  optional(:filename) => String.t(),
                  optional(:score) => number(),
                  optional(:text) => String.t()
                })
                | nil,
              required(:status) =>
                ((((:in_progress | :searching) | :completed) | :incomplete) | :failed)
                | String.t(),
              required(:type) => :file_search_call | String.t()
            }
  defstruct [:agent, :id, :queries, :results, :status, :type]
end
