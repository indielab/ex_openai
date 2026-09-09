defmodule ExOpenAI.Components.BetaResponseWebSearchCallCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a web search call is completed.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    Unique ID for the output item associated with the web search call.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the web search call is associated with.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of the web search call being processed.

  * `:type` - **required** - `:"response.web_search_call.completed"`
    The type of the event. Always `response.web_search_call.completed`.
    Allowed values: `"response.web_search_call.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.web_search_call.completed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.web_search_call.completed" | String.t()
            }
  defstruct [:agent, :item_id, :output_index, :sequence_number, :type]
end
