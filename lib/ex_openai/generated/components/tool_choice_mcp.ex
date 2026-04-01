defmodule ExOpenAI.Components.ToolChoiceMCP do
  use ExOpenAI.Jason

  @moduledoc """
  Use this option to force the model to call a specific tool on a remote MCP server.


  ## Fields

  * `:name` - **optional** - `String.t() | any()`

  * `:server_label` - **required** - `String.t()`  
    The label of the MCP server to use.

  * `:type` - **required** - `:mcp`  
    For MCP tools, the type is always `mcp`.  
    Allowed values: `"mcp"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          name: (String.t() | any()) | nil,
          server_label: String.t(),
          type: :mcp
        }
  defstruct [:name, :server_label, :type]
end
