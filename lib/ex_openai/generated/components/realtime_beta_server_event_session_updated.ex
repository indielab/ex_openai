defmodule ExOpenAI.Components.RealtimeBetaServerEventSessionUpdated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a session is updated with a `session.update` event, unless
  there is an error.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSession.t()`

  * `:type` - **required** - `:"session.updated"`  
    The event type, must be `session.updated`.  
    Allowed values: `"session.updated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session: ExOpenAI.Components.RealtimeSession.t(),
          type: :"session.updated"
        }
  defstruct [:event_id, :session, :type]
end
