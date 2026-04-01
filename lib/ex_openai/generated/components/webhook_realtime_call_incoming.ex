defmodule ExOpenAI.Components.WebhookRealtimeCallIncoming do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when Realtime API Receives a incoming SIP call.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the model response was completed.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:call_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:sip_headers]}, {:list, [], [{:%{}, [], [{{:required, [], [:name]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:required, [], [:value]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}]}}]}`  
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
  defstruct [:created_at, :data, :id, :object, :type]
end
