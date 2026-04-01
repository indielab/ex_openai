defmodule ExOpenAI.Components.MCPListTools do
  use ExOpenAI.Jason

  @moduledoc """
  A list of tools available on an MCP server.


  ## Fields

  * `:error` - **optional** - `String.t() | any()`

  * `:id` - **required** - `String.t()`  
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
          error: (String.t() | any()) | nil,
          id: String.t(),
          server_label: String.t(),
          tools: list(ExOpenAI.Components.MCPListToolsTool.t()),
          type: :mcp_list_tools
        }
  defstruct [:error, :id, :server_label, :tools, :type]
end
