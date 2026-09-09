defmodule ExOpenAI.Components.BetaMCPListTools do
  use ExOpenAI.Jason

  @moduledoc """
  A list of tools available on an MCP server.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:error` - **optional** - `String.t() | nil`

  * `:id` - **required** - `String.t()`
    The unique ID of the list.

  * `:server_label` - **required** - `String.t()`
    The label of the MCP server.

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaMCPListToolsTool.t())`
    The tools available on the server.

  * `:type` - **required** - `:mcp_list_tools`
    The type of the item. Always `mcp_list_tools`.
    Allowed values: `"mcp_list_tools"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          error: (String.t() | nil) | nil,
          id: String.t(),
          server_label: String.t(),
          tools: list(ExOpenAI.Components.BetaMCPListToolsTool.t()),
          type: :mcp_list_tools
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              optional(:error) => String.t() | nil,
              required(:id) => String.t(),
              required(:server_label) => String.t(),
              required(:tools) => list(ExOpenAI.Components.BetaMCPListToolsTool.input()),
              required(:type) => :mcp_list_tools | String.t()
            }
  defstruct [:agent, :error, :id, :server_label, :tools, :type]
end
