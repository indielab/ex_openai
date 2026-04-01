defmodule ExOpenAI.Components.RealtimeMCPListTools do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime item listing tools available on an MCP server.


  ## Fields

  * `:id` - **optional** - `String.t()`  
    The unique ID of the list.

  * `:server_label` - **required** - `String.t()`  
    The label of the MCP server.

  * `:tools` - **required** - `[ExOpenAI.Components.MCPListToolsTool.t()]`  
    The tools available on the server.

  * `:type` - **required** - `:mcp_list_tools`  
    The type of the item. Always `mcp_list_tools`.  
    Allowed values: `"mcp_list_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          id: String.t() | nil,
          server_label: String.t(),
          tools: list(ExOpenAI.Components.MCPListToolsTool.t()),
          type: :mcp_list_tools
        }
  defstruct [:id, :server_label, :tools, :type]
end
