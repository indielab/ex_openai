defmodule ExOpenAI.Components.RealtimeBetaServerEventSessionCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a Session is created. Emitted automatically when a new
  connection is established as the first server event. This event will contain
  the default Session configuration.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSession.t()`

  * `:type` - **required** - `:"session.created"`  
    The event type, must be `session.created`.  
    Allowed values: `"session.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session: ExOpenAI.Components.RealtimeSession.t(),
          type: :"session.created"
        }
  defstruct [:event_id, :session, :type]
end
