defmodule ExOpenAI.Components.WebSearchToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  The results of a web search tool call. See the
  [web search guide](/docs/guides/tools-web-search) for more information.


  ## Fields

  * `:action` - **required** - `map()`  
    An object describing the specific action taken in this web search call.
  Includes details on how the model used the web (search, open_page, find_in_page).

  * `:id` - **required** - `String.t()`  
    The unique ID of the web search tool call.

  * `:status` - **required** - `:in_progress | :searching | :completed | :failed`  
    The status of the web search tool call.  
    Allowed values: `"in_progress"`, `"searching"`, `"completed"`, `"failed"`

  * `:type` - **required** - `:web_search_call`  
    The type of the web search tool call. Always `web_search_call`.  
    Allowed values: `"web_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: map(),
          id: String.t(),
          status: ((:in_progress | :searching) | :completed) | :failed,
          type: :web_search_call
        }
  defstruct [:action, :id, :status, :type]
end
