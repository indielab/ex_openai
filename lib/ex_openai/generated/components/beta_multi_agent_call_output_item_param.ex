defmodule ExOpenAI.Components.BetaMultiAgentCallOutputItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaMultiAgentCallOutputItemParam.

  ## Fields

  * `:action` - **required** - `ExOpenAI.Components.BetaMultiAgentAction1.t()`
    The multi-agent action that produced this result.

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:call_id` - **required** - `String.t()`
    The unique ID of the multi-agent call.
    Constraints: minLength: 1, maxLength: 64

  * `:id` - **optional** - `String.t() | nil`

  * `:output` - **required** - `list(ExOpenAI.Components.BetaOutputTextContentParam.t())`
    Text output returned by the multi-agent action.

  * `:type` - **required** - `:multi_agent_call_output`
    The item type. Always `multi_agent_call_output`.
    Allowed values: `"multi_agent_call_output"`
    Default: `"multi_agent_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaMultiAgentAction1.t(),
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          call_id: String.t(),
          id: (String.t() | nil) | nil,
          output: list(ExOpenAI.Components.BetaOutputTextContentParam.t()),
          type: :multi_agent_call_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:action) => ExOpenAI.Components.BetaMultiAgentAction1.input(),
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:call_id) => String.t(),
              optional(:id) => String.t() | nil,
              required(:output) => list(ExOpenAI.Components.BetaOutputTextContentParam.input()),
              required(:type) => :multi_agent_call_output | String.t()
            }
  defstruct [:action, :agent, :call_id, :id, :output, :type]
end
