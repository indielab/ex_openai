defmodule ExOpenAI.Components.ResponseMCPCallArgumentsDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the arguments for an MCP tool call are finalized.


  ## Fields

  * `:arguments` - **required** - `String.t()`
    A JSON string containing the finalized arguments for the MCP tool call.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the MCP tool call item being processed.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response's output array.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_call_arguments.done"`
    The type of the event. Always 'response.mcp_call_arguments.done'.
    Allowed values: `"response.mcp_call_arguments.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_call_arguments.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:arguments) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.mcp_call_arguments.done" | String.t()
            }
  defstruct [:arguments, :item_id, :output_index, :sequence_number, :type]
end
