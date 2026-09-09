defmodule ExOpenAI.Components.BetaResponseCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the model response is complete.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:response` - **required** - `ExOpenAI.Components.BetaResponse.t()`
    Properties of the completed response.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:type` - **required** - `:"response.completed"`
    The type of the event. Always `response.completed`.
    Allowed values: `"response.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          response: ExOpenAI.Components.BetaResponse.t(),
          sequence_number: integer(),
          type: :"response.completed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:response) => ExOpenAI.Components.BetaResponse.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.completed" | String.t()
            }
  defstruct [:agent, :response, :sequence_number, :type]
end
