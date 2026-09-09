defmodule ExOpenAI.Components.BetaResponseQueuedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a response is queued and waiting to be processed.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:response` - **required** - `ExOpenAI.Components.BetaResponse.t()`
    The full response object that is queued.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:type` - **required** - `:"response.queued"`
    The type of the event. Always 'response.queued'.
    Allowed values: `"response.queued"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          response: ExOpenAI.Components.BetaResponse.t(),
          sequence_number: integer(),
          type: :"response.queued"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:response) => ExOpenAI.Components.BetaResponse.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.queued" | String.t()
            }
  defstruct [:agent, :response, :sequence_number, :type]
end
