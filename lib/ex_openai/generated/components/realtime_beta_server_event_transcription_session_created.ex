defmodule ExOpenAI.Components.RealtimeBetaServerEventTranscriptionSessionCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a transcription session is created.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse.t()`

  * `:type` - **required** - `:"transcription_session.created"`
    The event type, must be `transcription_session.created`.
    Allowed values: `"transcription_session.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session: ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse.t(),
          type: :"transcription_session.created"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:session) =>
                ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse.input(),
              required(:type) => :"transcription_session.created" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
