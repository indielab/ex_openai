defmodule ExOpenAI.Components.RealtimeMCPApprovalResponse do
  use ExOpenAI.Jason

  @moduledoc """
  A Realtime item responding to an MCP approval request.


  ## Fields

  * `:approval_request_id` - **required** - `String.t()`
    The ID of the approval request being answered.

  * `:approve` - **required** - `boolean()`
    Whether the request was approved.

  * `:id` - **required** - `String.t()`
    The unique ID of the approval response.

  * `:reason` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:mcp_approval_response`
    The type of the item. Always `mcp_approval_response`.
    Allowed values: `"mcp_approval_response"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          approval_request_id: String.t(),
          approve: boolean(),
          id: String.t(),
          reason: (String.t() | nil) | nil,
          type: :mcp_approval_response
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:approval_request_id) => String.t(),
              required(:approve) => boolean(),
              required(:id) => String.t(),
              optional(:reason) => String.t() | nil,
              required(:type) => :mcp_approval_response | String.t()
            }
  defstruct [:approval_request_id, :approve, :id, :reason, :type]
end
