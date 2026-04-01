defmodule ExOpenAI.Components.RealtimeBetaServerEventTranscriptionSessionUpdated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a transcription session is updated with a `transcription_session.update` event, unless 
  there is an error.


  ## Fields

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse.t()`

  * `:type` - **required** - `:"transcription_session.updated"`  
    The event type, must be `transcription_session.updated`.  
    Allowed values: `"transcription_session.updated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session: ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponse.t(),
          type: :"transcription_session.updated"
        }
  defstruct [:event_id, :session, :type]
end
