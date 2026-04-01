defmodule ExOpenAI.Components.MCPApprovalResponse do
  use ExOpenAI.Jason

  @moduledoc """
  A response to an MCP approval request.


  ## Fields

  * `:approval_request_id` - **required** - `String.t()`  
    The ID of the approval request being answered.

  * `:approve` - **required** - `boolean()`  
    Whether the request was approved.

  * `:id` - **optional** - `String.t() | any()`

  * `:reason` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:mcp_approval_response`  
    The type of the item. Always `mcp_approval_response`.  
    Allowed values: `"mcp_approval_response"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          approval_request_id: String.t(),
          approve: boolean(),
          id: (String.t() | any()) | nil,
          reason: (String.t() | any()) | nil,
          type: :mcp_approval_response
        }
  defstruct [:approval_request_id, :approve, :id, :reason, :type]
end
