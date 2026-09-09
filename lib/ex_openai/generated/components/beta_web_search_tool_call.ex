defmodule ExOpenAI.Components.BetaWebSearchToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  The results of a web search tool call. See the
  [web search guide](https://platform.openai.com/docs/guides/tools-web-search) for more information.


  ## Fields

  * `:action` - **required** - `map()`
    An object describing the specific action taken in this web search call.
  Includes details on how the model used the web (search, open_page, find_in_page).

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

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
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          id: String.t(),
          status: ((:in_progress | :searching) | :completed) | :failed,
          type: :web_search_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:action) =>
                (ExOpenAI.Components.BetaWebSearchActionSearch.input()
                 | ExOpenAI.Components.BetaWebSearchActionOpenPage.input())
                | ExOpenAI.Components.BetaWebSearchActionFind.input(),
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:id) => String.t(),
              required(:status) =>
                (((:in_progress | :searching) | :completed) | :failed) | String.t(),
              required(:type) => :web_search_call | String.t()
            }
  defstruct [:action, :agent, :id, :status, :type]
end
