defmodule ExOpenAI.Components.ResponseMCPCallCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an MCP  tool call has completed successfully.


  ## Fields

  * `:item_id` - **required** - `String.t()`
    The ID of the MCP tool call item that completed.

  * `:output_index` - **required** - `integer()`
    The index of the output item that completed.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_call.completed"`
    The type of the event. Always 'response.mcp_call.completed'.
    Allowed values: `"response.mcp_call.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_call.completed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.mcp_call.completed" | String.t()
            }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
