defmodule ExOpenAI.Components.ResponseAudioTranscriptDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the full audio transcript is completed.

  ## Fields

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.audio.transcript.done"`
    The type of the event. Always `response.audio.transcript.done`.
    Allowed values: `"response.audio.transcript.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          sequence_number: integer(),
          type: :"response.audio.transcript.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:sequence_number) => integer(),
              required(:type) => :"response.audio.transcript.done" | String.t()
            }
  defstruct [:sequence_number, :type]
end
