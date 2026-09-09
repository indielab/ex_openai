defmodule ExOpenAI.Components.RealtimeMCPListTools do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime item listing tools available on an MCP server.


  ## Fields

  * `:id` - **optional** - `String.t()`
    The unique ID of the list.

  * `:server_label` - **required** - `String.t()`
    The label of the MCP server.

  * `:tools` - **required** - `list(ExOpenAI.Components.MCPListToolsTool.t())`
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:id) => String.t(),
              required(:server_label) => String.t(),
              required(:tools) => list(ExOpenAI.Components.MCPListToolsTool.input()),
              required(:type) => :mcp_list_tools | String.t()
            }
  defstruct [:id, :server_label, :tools, :type]
end
