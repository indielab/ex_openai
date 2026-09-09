defmodule ExOpenAI.Components.ResponseMCPCallFailedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an MCP  tool call has failed.


  ## Fields

  * `:item_id` - **required** - `String.t()`
    The ID of the MCP tool call item that failed.

  * `:output_index` - **required** - `integer()`
    The index of the output item that failed.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_call.failed"`
    The type of the event. Always 'response.mcp_call.failed'.
    Allowed values: `"response.mcp_call.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_call.failed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.mcp_call.failed" | String.t()
            }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
