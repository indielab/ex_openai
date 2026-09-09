defmodule ExOpenAI.Components.BetaMultiAgentCallItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaMultiAgentCallItemParam.

  ## Fields

  * `:action` - **required** - `ExOpenAI.Components.BetaMultiAgentAction1.t()`
    The multi-agent action that was executed.

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:arguments` - **required** - `String.t()`
    The action arguments as a JSON string.

  * `:call_id` - **required** - `String.t()`
    The unique ID linking this call to its output.
    Constraints: minLength: 1, maxLength: 64

  * `:id` - **optional** - `String.t() | nil`

  * `:type` - **required** - `:multi_agent_call`
    The item type. Always `multi_agent_call`.
    Allowed values: `"multi_agent_call"`
    Default: `"multi_agent_call"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaMultiAgentAction1.t(),
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          arguments: String.t(),
          call_id: String.t(),
          id: (String.t() | nil) | nil,
          type: :multi_agent_call
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:action) => ExOpenAI.Components.BetaMultiAgentAction1.input(),
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:arguments) => String.t(),
              required(:call_id) => String.t(),
              optional(:id) => String.t() | nil,
              required(:type) => :multi_agent_call | String.t()
            }
  defstruct [:action, :agent, :arguments, :call_id, :id, :type]
end
