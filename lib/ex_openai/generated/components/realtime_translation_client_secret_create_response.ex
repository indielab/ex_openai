defmodule ExOpenAI.Components.RealtimeTranslationClientSecretCreateResponse do
  use ExOpenAI.Jason

  @moduledoc """
  Response from creating a translation session and client secret for the Realtime API.


  ## Fields

  * `:expires_at` - **required** - `integer()`
    Expiration timestamp for the client secret, in seconds since epoch.
    Format: `unixtime`

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranslationSession.t()`

  * `:value` - **required** - `String.t()`
    The generated client secret value.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          expires_at: integer(),
          session: ExOpenAI.Components.RealtimeTranslationSession.t(),
          value: String.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:expires_at) => integer(),
              required(:session) => ExOpenAI.Components.RealtimeTranslationSession.input(),
              required(:value) => String.t()
            }
  defstruct [:expires_at, :session, :value]
end
