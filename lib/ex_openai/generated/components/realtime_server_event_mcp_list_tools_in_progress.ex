defmodule ExOpenAI.Components.RealtimeServerEventMCPListToolsInProgress do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when listing MCP tools is in progress for an item.

  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the MCP list tools item.

  * `:type` - **required** - `:"mcp_list_tools.in_progress"`  
    The event type, must be `mcp_list_tools.in_progress`.  
    Allowed values: `"mcp_list_tools.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item_id: String.t(),
          type: :"mcp_list_tools.in_progress"
        }
  defstruct [:event_id, :item_id, :type]
end
