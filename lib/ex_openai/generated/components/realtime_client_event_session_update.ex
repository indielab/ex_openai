defmodule ExOpenAI.Components.RealtimeClientEventSessionUpdate do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to update the session’s configuration.
  The client may send this event at any time to update any field
  except for `voice` and `model`. `voice` can be updated only if there have been no other audio outputs yet.

  When the server receives a `session.update`, it will respond
  with a `session.updated` event showing the full, effective configuration.
  Only the fields that are present in the `session.update` are updated. To clear a field like
  `instructions`, pass an empty string. To clear a field like `tools`, pass an empty array.
  To clear a field like `turn_detection`, pass `null`.


  ## Fields

  * `:event_id` - **optional** - `String.t()`  
    Optional client-generated ID used to identify this event. This is an arbitrary string that a client may assign. It will be passed back if there is an error with the event, but the corresponding `session.updated` event will not include it.  
    Constraints: maxLength: 512

  * `:session` - **required** - `map()`  
    Update the Realtime session. Choose either a realtime
  session or a transcription session.

  * `:type` - **required** - `:"session.update"`  
    The event type, must be `session.update`.  
    Allowed values: `"session.update"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          session: map(),
          type: :"session.update"
        }
  defstruct [:event_id, :session, :type]
end
