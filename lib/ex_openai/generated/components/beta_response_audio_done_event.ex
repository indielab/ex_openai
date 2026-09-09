defmodule ExOpenAI.Components.BetaResponseAudioDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the audio response is complete.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of the delta.

  * `:type` - **required** - `:"response.audio.done"`
    The type of the event. Always `response.audio.done`.
    Allowed values: `"response.audio.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          sequence_number: integer(),
          type: :"response.audio.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:sequence_number) => integer(),
              required(:type) => :"response.audio.done" | String.t()
            }
  defstruct [:agent, :sequence_number, :type]
end
