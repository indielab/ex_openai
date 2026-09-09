defmodule ExOpenAI.Components.BetaToolSearchCallItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaToolSearchCallItemParam.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:arguments` - **required** - `ExOpenAI.Components.BetaEmptyModelParam.t()`
    The arguments supplied to the tool search call.

  * `:call_id` - **optional** - `String.t() | nil`

  * `:execution` - **optional** - `ExOpenAI.Components.BetaToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **optional** - `String.t() | nil`

  * `:status` - **optional** - `ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil`

  * `:type` - **required** - `:tool_search_call`
    The item type. Always `tool_search_call`.
    Allowed values: `"tool_search_call"`
    Default: `"tool_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          arguments: ExOpenAI.Components.BetaEmptyModelParam.t(),
          call_id: (String.t() | nil) | nil,
          execution: ExOpenAI.Components.BetaToolSearchExecutionType.t() | nil,
          id: (String.t() | nil) | nil,
          status: (ExOpenAI.Components.BetaFunctionCallItemStatus.t() | nil) | nil,
          type: :tool_search_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:arguments) => ExOpenAI.Components.BetaEmptyModelParam.input(),
              optional(:call_id) => String.t() | nil,
              optional(:execution) => ExOpenAI.Components.BetaToolSearchExecutionType.input(),
              optional(:id) => String.t() | nil,
              optional(:status) => ExOpenAI.Components.BetaFunctionCallItemStatus.input() | nil,
              required(:type) => :tool_search_call | String.t()
            }
  defstruct [:agent, :arguments, :call_id, :execution, :id, :status, :type]
end
