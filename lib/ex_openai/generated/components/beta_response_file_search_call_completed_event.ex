defmodule ExOpenAI.Components.BetaResponseFileSearchCallCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a file search call is completed (results found).

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the file search call is initiated.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the file search call is initiated.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.file_search_call.completed"`
    The type of the event. Always `response.file_search_call.completed`.
    Allowed values: `"response.file_search_call.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.file_search_call.completed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.file_search_call.completed" | String.t()
            }
  defstruct [:agent, :item_id, :output_index, :sequence_number, :type]
end
