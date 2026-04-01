defmodule ExOpenAI.Components.FileSearchToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  The results of a file search tool call. See the
  [file search guide](/docs/guides/tools-file-search) for more information.


  ## Fields

  * `:id` - **required** - `String.t()`  
    The unique ID of the file search tool call.

  * `:queries` - **required** - `[String.t()]`  
    The queries used to search for files.

  * `:results` - **optional** - `[{:%{}, [], [{{:optional, [], [:attributes]}, {{:., [], [ExOpenAI.Components.VectorStoreFileAttributes, :t]}, [], []}}, {{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:filename]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:score]}, {:number, [], []}}, {{:optional, [], [:text]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}] | any()`

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
          id: String.t(),
          queries: list(String.t()),
          results:
            (list(%{
               optional(:attributes) => ExOpenAI.Components.VectorStoreFileAttributes.t(),
               optional(:file_id) => String.t(),
               optional(:filename) => String.t(),
               optional(:score) => number(),
               optional(:text) => String.t()
             })
             | any())
            | nil,
          status: (((:in_progress | :searching) | :completed) | :incomplete) | :failed,
          type: :file_search_call
        }
  defstruct [:id, :queries, :results, :status, :type]
end
