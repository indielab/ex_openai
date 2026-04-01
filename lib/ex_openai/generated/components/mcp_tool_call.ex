defmodule ExOpenAI.Components.MCPToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  An invocation of a tool on an MCP server.


  ## Fields

  * `:approval_request_id` - **optional** - `String.t() | any()`

  * `:arguments` - **required** - `String.t()`  
    A JSON string of the arguments passed to the tool.

  * `:error` - **optional** - `String.t() | any()`

  * `:id` - **required** - `String.t()`  
    The unique ID of the tool call.

  * `:name` - **required** - `String.t()`  
    The name of the tool that was run.

  * `:output` - **optional** - `String.t() | any()`

  * `:server_label` - **required** - `String.t()`  
    The label of the MCP server running the tool.

  * `:status` - **optional** - `ExOpenAI.Components.MCPToolCallStatus.t()`  
    The status of the tool call. One of `in_progress`, `completed`, `incomplete`, `calling`, or `failed`.

  * `:type` - **required** - `:mcp_call`  
    The type of the item. Always `mcp_call`.  
    Allowed values: `"mcp_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          approval_request_id: (String.t() | any()) | nil,
          arguments: String.t(),
          error: (String.t() | any()) | nil,
          id: String.t(),
          name: String.t(),
          output: (String.t() | any()) | nil,
          server_label: String.t(),
          status: ExOpenAI.Components.MCPToolCallStatus.t() | nil,
          type: :mcp_call
        }
  defstruct [
    :approval_request_id,
    :arguments,
    :error,
    :id,
    :name,
    :output,
    :server_label,
    :status,
    :type
  ]
end
