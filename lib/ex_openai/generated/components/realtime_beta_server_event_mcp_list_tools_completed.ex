defmodule ExOpenAI.Components.RealtimeBetaServerEventMCPListToolsCompleted do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when listing MCP tools has completed for an item.

  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the MCP list tools item.

  * `:type` - **required** - `:"mcp_list_tools.completed"`  
    The event type, must be `mcp_list_tools.completed`.  
    Allowed values: `"mcp_list_tools.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          item_id: String.t(),
          type: :"mcp_list_tools.completed"
        }
  defstruct [:event_id, :item_id, :type]
end
