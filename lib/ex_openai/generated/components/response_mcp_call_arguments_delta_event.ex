defmodule ExOpenAI.Components.ResponseMCPCallArgumentsDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a delta (partial update) to the arguments of an MCP tool call.


  ## Fields

  * `:delta` - **required** - `String.t()`
    A JSON string containing the partial update to the arguments for the MCP tool call.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the MCP tool call item being processed.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_call_arguments.delta"`
    The type of the event. Always 'response.mcp_call_arguments.delta'.
    Allowed values: `"response.mcp_call_arguments.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_call_arguments.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:delta) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.mcp_call_arguments.delta" | String.t()
            }
  defstruct [:delta, :item_id, :output_index, :sequence_number, :type]
end
