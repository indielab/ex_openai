defmodule ExOpenAI.Components.RealtimeServerEventSessionUpdated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a session is updated with a `session.update` event, unless
  there is an error.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSessionCreateResponseGA.t() | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t()`
    The session configuration.

  * `:type` - **required** - `:"session.updated"`
    The event type, must be `session.updated`.
    Allowed values: `"session.updated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session:
            ExOpenAI.Components.RealtimeSessionCreateResponseGA.t()
            | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t(),
          type: :"session.updated"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:session) =>
                ExOpenAI.Components.RealtimeSessionCreateResponseGA.input()
                | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.input(),
              required(:type) => :"session.updated" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
