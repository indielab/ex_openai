defmodule ExOpenAI.Components.BetaToolSearchOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaToolSearchOutput.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t() | nil`

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:execution` - **required** - `ExOpenAI.Components.BetaToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **required** - `String.t()`
    The unique ID of the tool search output item.

  * `:status` - **required** - `ExOpenAI.Components.BetaFunctionCallOutputStatusEnum.t()`
    The status of the tool search output item that was recorded.

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaTool.t())`
    The loaded tool definitions returned by tool search.

  * `:type` - **required** - `:tool_search_output`
    The type of the item. Always `tool_search_output`.
    Allowed values: `"tool_search_output"`
    Default: `"tool_search_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          call_id: String.t() | nil,
          created_by: String.t() | nil,
          execution: ExOpenAI.Components.BetaToolSearchExecutionType.t(),
          id: String.t(),
          status: ExOpenAI.Components.BetaFunctionCallOutputStatusEnum.t(),
          tools: list(ExOpenAI.Components.BetaTool.t()),
          type: :tool_search_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:call_id) => String.t() | nil,
              optional(:created_by) => String.t(),
              required(:execution) => ExOpenAI.Components.BetaToolSearchExecutionType.input(),
              required(:id) => String.t(),
              required(:status) => ExOpenAI.Components.BetaFunctionCallOutputStatusEnum.input(),
              required(:tools) => list(ExOpenAI.Components.BetaTool.input()),
              required(:type) => :tool_search_output | String.t()
            }
  defstruct [:agent, :call_id, :created_by, :execution, :id, :status, :tools, :type]
end
