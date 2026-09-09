defmodule ExOpenAI.Components.BetaMCPToolCall do
  use ExOpenAI.Jason

  @moduledoc """
  An invocation of a tool on an MCP server.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:approval_request_id` - **optional** - `String.t() | nil`

  * `:arguments` - **required** - `String.t()`
    A JSON string of the arguments passed to the tool.

  * `:error` - **optional** - `String.t() | nil`

  * `:id` - **required** - `String.t()`
    The unique ID of the tool call.

  * `:name` - **required** - `String.t()`
    The name of the tool that was run.

  * `:output` - **optional** - `String.t() | nil`

  * `:server_label` - **required** - `String.t()`
    The label of the MCP server running the tool.

  * `:status` - **optional** - `ExOpenAI.Components.BetaMCPToolCallStatus.t()`
    The status of the tool call. One of `in_progress`, `completed`, `incomplete`, `calling`, or `failed`.

  * `:type` - **required** - `:mcp_call`
    The type of the item. Always `mcp_call`.
    Allowed values: `"mcp_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          approval_request_id: (String.t() | nil) | nil,
          arguments: String.t(),
          error: (String.t() | nil) | nil,
          id: String.t(),
          name: String.t(),
          output: (String.t() | nil) | nil,
          server_label: String.t(),
          status: ExOpenAI.Components.BetaMCPToolCallStatus.t() | nil,
          type: :mcp_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              optional(:approval_request_id) => String.t() | nil,
              required(:arguments) => String.t(),
              optional(:error) => String.t() | nil,
              required(:id) => String.t(),
              required(:name) => String.t(),
              optional(:output) => String.t() | nil,
              required(:server_label) => String.t(),
              optional(:status) => ExOpenAI.Components.BetaMCPToolCallStatus.input(),
              required(:type) => :mcp_call | String.t()
            }
  defstruct [
    :agent,
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
