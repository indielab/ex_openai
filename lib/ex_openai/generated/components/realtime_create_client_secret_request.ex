defmodule ExOpenAI.Components.RealtimeCreateClientSecretRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Create a session and client secret for the Realtime API. The request can specify
  either a realtime or a transcription session configuration.
  [Learn more about the Realtime API](/docs/guides/realtime).


  ## Fields

  * `:expires_after` - **optional** - `{:%{}, [], [{{:optional, [], [:anchor]}, :created_at}, {{:optional, [], [:seconds]}, {:integer, [], []}}]}`  
    Configuration for the client secret expiration. Expiration refers to the time after which
  a client secret will no longer be valid for creating sessions. The session itself may
  continue after that time once started. A secret can be used to create multiple sessions
  until it expires.

  * `:session` - **optional** - `ExOpenAI.Components.RealtimeSessionCreateRequestGA.t() | ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequestGA.t()`  
    Session configuration to use for the client secret. Choose either a realtime
  session or a transcription session.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_after:
            %{optional(:anchor) => :created_at, optional(:seconds) => integer()} | nil,
          session:
            (ExOpenAI.Components.RealtimeSessionCreateRequestGA.t()
             | ExOpenAI.Components.RealtimeTranscriptionSessionCreateRequestGA.t())
            | nil
        }
  defstruct [:expires_after, :session]
end
