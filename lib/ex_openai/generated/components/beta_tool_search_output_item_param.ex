defmodule ExOpenAI.Components.BetaToolSearchOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaToolSearchOutputItemParam.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:call_id` - **optional** - `String.t() | nil`

  * `:execution` - **optional** - `ExOpenAI.Components.BetaToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **optional** - `String.t() | nil`

  * `:status` - **optional** - `ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil`

  * `:tools` - **required** - `list(ExOpenAI.Components.BetaTool.t())`
    The loaded tool definitions returned by the tool search output.

  * `:type` - **required** - `:tool_search_output`
    The item type. Always `tool_search_output`.
    Allowed values: `"tool_search_output"`
    Default: `"tool_search_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          call_id: (String.t() | nil) | nil,
          execution: ExOpenAI.Components.BetaToolSearchExecutionType.t() | nil,
          id: (String.t() | nil) | nil,
          status: (ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil) | nil,
          tools: list(ExOpenAI.Components.BetaTool.t()),
          type: :tool_search_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              optional(:call_id) => String.t() | nil,
              optional(:execution) => ExOpenAI.Components.BetaToolSearchExecutionType.input(),
              optional(:id) => String.t() | nil,
              optional(:status) => ExOpenAI.Components.BetaFunctionCallItemStatus.input() | nil,
              required(:tools) => list(ExOpenAI.Components.BetaTool.input()),
              required(:type) => :tool_search_output | String.t()
            }
  defstruct [:agent, :call_id, :execution, :id, :status, :tools, :type]
end
