defmodule ExOpenAI.Components.BetaResponseAudioTranscriptDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial transcript of audio.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:delta` - **required** - `String.t()`
    The partial transcript of the audio response.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.audio.transcript.delta"`
    The type of the event. Always `response.audio.transcript.delta`.
    Allowed values: `"response.audio.transcript.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          delta: String.t(),
          sequence_number: integer(),
          type: :"response.audio.transcript.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:delta) => String.t(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.audio.transcript.delta" | String.t()
            }
  defstruct [:agent, :delta, :sequence_number, :type]
end
