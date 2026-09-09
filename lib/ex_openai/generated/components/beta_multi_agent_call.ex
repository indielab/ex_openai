defmodule ExOpenAI.Components.BetaMultiAgentCall do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaMultiAgentCall.

  ## Fields

  * `:action` - **required** - `ExOpenAI.Components.BetaMultiAgentAction.t()`
    The multi-agent action to execute.

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:arguments` - **required** - `String.t()`
    The JSON string of arguments generated for the action.

  * `:call_id` - **required** - `String.t()`
    The unique ID linking this call to its output.

  * `:id` - **required** - `String.t()`
    The unique ID of the multi-agent call item.

  * `:type` - **required** - `:multi_agent_call`
    The type of the multi-agent call. Always `multi_agent_call`.
    Allowed values: `"multi_agent_call"`
    Default: `"multi_agent_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaMultiAgentAction.t(),
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          arguments: String.t(),
          call_id: String.t(),
          id: String.t(),
          type: :multi_agent_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:action) => ExOpenAI.Components.BetaMultiAgentAction.input(),
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:arguments) => String.t(),
              required(:call_id) => String.t(),
              required(:id) => String.t(),
              required(:type) => :multi_agent_call | String.t()
            }
  defstruct [:action, :agent, :arguments, :call_id, :id, :type]
end
