defmodule ExOpenAI.Components.BetaResponseMCPListToolsFailedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the attempt to list available MCP tools has failed.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    The ID of the MCP tool call item that failed.

  * `:output_index` - **required** - `integer()`
    The index of the output item that failed.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_list_tools.failed"`
    The type of the event. Always 'response.mcp_list_tools.failed'.
    Allowed values: `"response.mcp_list_tools.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_list_tools.failed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.mcp_list_tools.failed" | String.t()
            }
  defstruct [:agent, :item_id, :output_index, :sequence_number, :type]
end
