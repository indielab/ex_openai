defmodule ExOpenAI.Components.RealtimeTranslationClientSecretCreateRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Create a translation session and client secret for the Realtime API.


  ## Fields

  * `:expires_after` - **optional** - `%{optional(:anchor) => :created_at, optional(:seconds) => integer()}`
    Configuration for the client secret expiration. Expiration refers to the time after which
  a client secret will no longer be valid for creating sessions. The session itself may
  continue after that time once started. A secret can be used to create multiple sessions
  until it expires.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranslationSessionCreateRequest.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_after:
            %{optional(:anchor) => :created_at, optional(:seconds) => integer()} | nil,
          session: ExOpenAI.Components.RealtimeTranslationSessionCreateRequest.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:expires_after) => %{
                optional(:anchor) => :created_at | String.t(),
                optional(:seconds) => integer()
              },
              required(:session) =>
                ExOpenAI.Components.RealtimeTranslationSessionCreateRequest.input()
            }
  defstruct [:expires_after, :session]
end
