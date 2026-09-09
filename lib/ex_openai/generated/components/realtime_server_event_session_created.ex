defmodule ExOpenAI.Components.RealtimeServerEventSessionCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a Session is created. Emitted automatically when a new
  connection is established as the first server event. This event will contain
  the default Session configuration.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSessionCreateResponseGA.t() | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t()`
    The session configuration.

  * `:type` - **required** - `:"session.created"`
    The event type, must be `session.created`.
    Allowed values: `"session.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session:
            ExOpenAI.Components.RealtimeSessionCreateResponseGA.t()
            | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t(),
          type: :"session.created"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:session) =>
                ExOpenAI.Components.RealtimeSessionCreateResponseGA.input()
                | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.input(),
              required(:type) => :"session.created" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
