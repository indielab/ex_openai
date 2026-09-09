defmodule ExOpenAI.Components.RealtimeClientEventTranscriptionSessionUpdate do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to update a transcription session.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequest.t()`

  * `:type` - **required** - `:"transcription_session.update"`
    The event type, must be `transcription_session.update`.
    Allowed values: `"transcription_session.update"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          session: ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequest.t(),
          type: :"transcription_session.update"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              required(:session) =>
                ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequest.input(),
              required(:type) => :"transcription_session.update" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
