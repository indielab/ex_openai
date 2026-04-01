defmodule ExOpenAI.Components.ResponseMCPListToolsInProgressEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the system is in the process of retrieving the list of available MCP tools.


  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The ID of the MCP tool call item that is being processed.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that is being processed.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.mcp_list_tools.in_progress"`  
    The type of the event. Always 'response.mcp_list_tools.in_progress'.  
    Allowed values: `"response.mcp_list_tools.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.mcp_list_tools.in_progress"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
