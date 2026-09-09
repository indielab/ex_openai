defmodule ExOpenAI.Components.BetaMCPApprovalResponse do
  use ExOpenAI.Jason

  @moduledoc """
  A response to an MCP approval request.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:approval_request_id` - **required** - `String.t()`
    The ID of the approval request being answered.

  * `:approve` - **required** - `boolean()`
    Whether the request was approved.

  * `:id` - **optional** - `String.t() | nil`

  * `:reason` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:mcp_approval_response`
    The type of the item. Always `mcp_approval_response`.
    Allowed values: `"mcp_approval_response"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          approval_request_id: String.t(),
          approve: boolean(),
          id: (String.t() | nil) | nil,
          reason: (String.t() | nil) | nil,
          type: :mcp_approval_response
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:approval_request_id) => String.t(),
              required(:approve) => boolean(),
              optional(:id) => String.t() | nil,
              optional(:reason) => String.t() | nil,
              required(:type) => :mcp_approval_response | String.t()
            }
  defstruct [:agent, :approval_request_id, :approve, :id, :reason, :type]
end
