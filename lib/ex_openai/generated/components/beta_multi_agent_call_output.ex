defmodule ExOpenAI.Components.BetaMultiAgentCallOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaMultiAgentCallOutput.

  ## Fields

  * `:action` - **required** - `ExOpenAI.Components.BetaMultiAgentAction.t()`
    The multi-agent action that produced this result.

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:call_id` - **required** - `String.t()`
    The unique ID of the multi-agent call.

  * `:id` - **required** - `String.t()`
    The unique ID of the multi-agent call output item.

  * `:output` - **required** - `list(ExOpenAI.Components.BetaOutputTextContent.t())`
    Text output returned by the multi-agent action.

  * `:type` - **required** - `:multi_agent_call_output`
    The type of the multi-agent result. Always `multi_agent_call_output`.
    Allowed values: `"multi_agent_call_output"`
    Default: `"multi_agent_call_output"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaMultiAgentAction.t(),
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          call_id: String.t(),
          id: String.t(),
          output: list(ExOpenAI.Components.BetaOutputTextContent.t()),
          type: :multi_agent_call_output
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:action) => ExOpenAI.Components.BetaMultiAgentAction.input(),
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:call_id) => String.t(),
              required(:id) => String.t(),
              required(:output) => list(ExOpenAI.Components.BetaOutputTextContent.input()),
              required(:type) => :multi_agent_call_output | String.t()
            }
  defstruct [:action, :agent, :call_id, :id, :output, :type]
end
