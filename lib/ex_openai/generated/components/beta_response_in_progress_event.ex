defmodule ExOpenAI.Components.BetaResponseInProgressEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the response is in progress.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:response` - **required** - `ExOpenAI.Components.BetaResponse.t()`
    The response that is in progress.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.in_progress"`
    The type of the event. Always `response.in_progress`.
    Allowed values: `"response.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          response: ExOpenAI.Components.BetaResponse.t(),
          sequence_number: integer(),
          type: :"response.in_progress"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:response) => ExOpenAI.Components.BetaResponse.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.in_progress" | String.t()
            }
  defstruct [:agent, :response, :sequence_number, :type]
end
