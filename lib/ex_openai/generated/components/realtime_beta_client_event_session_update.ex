defmodule ExOpenAI.Components.RealtimeBetaClientEventSessionUpdate do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to update the session’s default configuration.
  The client may send this event at any time to update any field,
  except for `voice`. However, note that once a session has been
  initialized with a particular `model`, it can’t be changed to
  another model using `session.update`.

  When the server receives a `session.update`, it will respond
  with a `session.updated` event showing the full, effective configuration.
  Only the fields that are present are updated. To clear a field like
  `instructions`, pass an empty string.


  ## Fields

  * `:event_id` - **optional** - `String.t()`  
    Optional client-generated ID used to identify this event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSessionCreateRequest.t()`

  * `:type` - **required** - `:"session.update"`  
    The event type, must be `session.update`.  
    Allowed values: `"session.update"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          session: ExOpenAI.Components.RealtimeSessionCreateRequest.t(),
          type: :"session.update"
        }
  defstruct [:event_id, :session, :type]
end
