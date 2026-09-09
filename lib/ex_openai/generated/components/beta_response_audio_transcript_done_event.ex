defmodule ExOpenAI.Components.BetaResponseAudioTranscriptDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the full audio transcript is completed.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.audio.transcript.done"`
    The type of the event. Always `response.audio.transcript.done`.
    Allowed values: `"response.audio.transcript.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          sequence_number: integer(),
          type: :"response.audio.transcript.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:sequence_number) => integer(),
              required(:type) => :"response.audio.transcript.done" | String.t()
            }
  defstruct [:agent, :sequence_number, :type]
end
