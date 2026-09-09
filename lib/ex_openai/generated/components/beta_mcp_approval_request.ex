defmodule ExOpenAI.Components.BetaMCPApprovalRequest do
  use ExOpenAI.Jason

  @moduledoc """
  A request for human approval of a tool invocation.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:arguments` - **required** - `String.t()`
    A JSON string of arguments for the tool.

  * `:id` - **required** - `String.t()`
    The unique ID of the approval request.

  * `:name` - **required** - `String.t()`
    The name of the tool to run.

  * `:server_label` - **required** - `String.t()`
    The label of the MCP server making the request.

  * `:type` - **required** - `:mcp_approval_request`
    The type of the item. Always `mcp_approval_request`.
    Allowed values: `"mcp_approval_request"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          arguments: String.t(),
          id: String.t(),
          name: String.t(),
          server_label: String.t(),
          type: :mcp_approval_request
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:arguments) => String.t(),
              required(:id) => String.t(),
              required(:name) => String.t(),
              required(:server_label) => String.t(),
              required(:type) => :mcp_approval_request | String.t()
            }
  defstruct [:agent, :arguments, :id, :name, :server_label, :type]
end
