defmodule ExOpenAI.Components.RealtimeCreateClientSecretResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Response from creating a session and client secret for the Realtime API.


  ## Fields

  * `:expires_at` - **required** - `integer()`  
    Expiration timestamp for the client secret, in seconds since epoch.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeSessionCreateResponseGA.t() | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t()`  
    The session configuration for either a realtime or transcription session.

  * `:value` - **required** - `String.t()`  
    The generated client secret value.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_at: integer(),
          session:
            ExOpenAI.Components.RealtimeSessionCreateResponseGA.t()
            | ExOpenAI.Components.RealtimeTranscriptionSessionCreateResponseGA.t(),
          value: String.t()
        }
  defstruct [:expires_at, :session, :value]
end
