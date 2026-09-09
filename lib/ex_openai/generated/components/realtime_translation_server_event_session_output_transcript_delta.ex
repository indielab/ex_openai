defmodule ExOpenAI.Components.RealtimeTranslationServerEventSessionOutputTranscriptDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when translated transcript text is available.

  Transcript deltas are append-only text fragments. Clients should not insert
  unconditional spaces between deltas.


  ## Fields

  * `:delta` - **required** - `String.t()`
    Append-only transcript text for the translated output audio.

  * `:elapsed_ms` - **optional** - `integer() | nil`

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:type` - **required** - `:"session.output_transcript.delta"`
    The event type, must be `session.output_transcript.delta`.
    Allowed values: `"session.output_transcript.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          elapsed_ms: (integer() | nil) | nil,
          event_id: String.t(),
          type: :"session.output_transcript.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:delta) => String.t(),
              optional(:elapsed_ms) => integer() | nil,
              required(:event_id) => String.t(),
              required(:type) => :"session.output_transcript.delta" | String.t()
            }
  defstruct [:delta, :elapsed_ms, :event_id, :type]
end
