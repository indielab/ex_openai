defmodule ExOpenAI.Components.WebhookLiveCallIncoming do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when an incoming API SIP session is available for Live acceptance. The
  same pending session can also emit `realtime.call.incoming`; the first
  successful Realtime or Live accept endpoint selects the runtime surface.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the event was created.
    Format: `unixtime`

  * `:data` - **required** - `%{ required(:session_id) => String.t(), required(:sip_headers) => list(%{required(:name) => String.t(), required(:value) => String.t()}) }`
    Event data payload.

  * `:id` - **required** - `String.t()`
    The unique ID of the event.

  * `:object` - **optional** - `:event`
    The object of the event. Always `event`.
    Allowed values: `"event"`

  * `:type` - **required** - `:"live.call.incoming"`
    The type of the event. Always `live.call.incoming`.
    Allowed values: `"live.call.incoming"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{
            required(:session_id) => String.t(),
            required(:sip_headers) =>
              list(%{required(:name) => String.t(), required(:value) => String.t()})
          },
          id: String.t(),
          object: :event | nil,
          type: :"live.call.incoming"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data) => %{
                required(:session_id) => String.t(),
                required(:sip_headers) =>
                  list(%{required(:name) => String.t(), required(:value) => String.t()})
              },
              required(:id) => String.t(),
              optional(:object) => :event | String.t(),
              required(:type) => :"live.call.incoming" | String.t()
            }
  defstruct [:created_at, :data, :id, :object, :type]
end
