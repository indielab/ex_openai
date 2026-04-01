defmodule ExOpenAI.Components.WebhookResponseFailed do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a background response has failed.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the model response failed.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"response.failed"`  
    The type of the event. Always `response.failed`.  
    Allowed values: `"response.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"response.failed"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
