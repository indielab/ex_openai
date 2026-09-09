defmodule ExOpenAI.Components.WebhookRealtimeCallIncoming do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when an incoming API SIP session is available for Realtime acceptance.
  The same pending session can also emit `live.call.incoming`; the first
  successful Realtime or Live accept endpoint selects the runtime surface.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the model response was completed.
    Format: `unixtime`

  * `:data` - **required** - `%{ required(:call_id) => String.t(), required(:sip_headers) => list(%{required(:name) => String.t(), required(:value) => String.t()}) }`
    Event data payload.

  * `:id` - **required** - `String.t()`
    The unique ID of the event.

  * `:object` - **optional** - `:event`
    The object of the event. Always `event`.
    Allowed values: `"event"`

  * `:type` - **required** - `:"realtime.call.incoming"`
    The type of the event. Always `realtime.call.incoming`.
    Allowed values: `"realtime.call.incoming"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{
            required(:call_id) => String.t(),
            required(:sip_headers) =>
              list(%{required(:name) => String.t(), required(:value) => String.t()})
          },
          id: String.t(),
          object: :event | nil,
          type: :"realtime.call.incoming"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data) => %{
                required(:call_id) => String.t(),
                required(:sip_headers) =>
                  list(%{required(:name) => String.t(), required(:value) => String.t()})
              },
              required(:id) => String.t(),
              optional(:object) => :event | String.t(),
              required(:type) => :"realtime.call.incoming" | String.t()
            }
  defstruct [:created_at, :data, :id, :object, :type]
end
