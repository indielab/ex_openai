defmodule ExOpenAI.Components.BetaToolSearchCall do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaToolSearchCall.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:arguments` - **required** - `any()`
    Arguments used for the tool search call.

  * `:call_id` - **required** - `String.t() | nil`

  * `:created_by` - **optional** - `String.t()`
    The identifier of the actor that created the item.

  * `:execution` - **required** - `ExOpenAI.Components.BetaToolSearchExecutionType.t()`
    Whether tool search was executed by the server or by the client.

  * `:id` - **required** - `String.t()`
    The unique ID of the tool search call item.

  * `:status` - **required** - `ExOpenAI.Components.BetaFunctionCallStatus.t()`
    The status of the tool search call item that was recorded.

  * `:type` - **required** - `:tool_search_call`
    The type of the item. Always `tool_search_call`.
    Allowed values: `"tool_search_call"`
    Default: `"tool_search_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          arguments: any(),
          call_id: String.t() | nil,
          created_by: String.t() | nil,
          execution: ExOpenAI.Components.BetaToolSearchExecutionType.t(),
          id: String.t(),
          status: ExOpenAI.Components.BetaFunctionCallStatus.t(),
          type: :tool_search_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:arguments) => any(),
              required(:call_id) => String.t() | nil,
              optional(:created_by) => String.t(),
              required(:execution) => ExOpenAI.Components.BetaToolSearchExecutionType.input(),
              required(:id) => String.t(),
              required(:status) => ExOpenAI.Components.BetaFunctionCallStatus.input(),
              required(:type) => :tool_search_call | String.t()
            }
  defstruct [:agent, :arguments, :call_id, :created_by, :execution, :id, :status, :type]
end
