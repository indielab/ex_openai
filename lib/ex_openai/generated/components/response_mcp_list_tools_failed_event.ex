defmodule ExOpenAI.Components.ResponseMCPListToolsFailedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the attempt to list available MCP tools has failed.


  ## Fields

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
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_list_tools.failed"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
