defmodule ExOpenAI.Components.BetaResponseCreatedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  An event that is emitted when a response is created.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:response` - **required** - `ExOpenAI.Components.BetaResponse.t()`
    The response that was created.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:type` - **required** - `:"response.created"`
    The type of the event. Always `response.created`.
    Allowed values: `"response.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          response: ExOpenAI.Components.BetaResponse.t(),
          sequence_number: integer(),
          type: :"response.created"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:response) => ExOpenAI.Components.BetaResponse.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.created" | String.t()
            }
  defstruct [:agent, :response, :sequence_number, :type]
end
