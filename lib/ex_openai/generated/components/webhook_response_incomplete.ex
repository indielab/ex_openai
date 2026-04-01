defmodule ExOpenAI.Components.WebhookResponseIncomplete do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a background response has been interrupted.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the model response was interrupted.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"response.incomplete"`  
    The type of the event. Always `response.incomplete`.  
    Allowed values: `"response.incomplete"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"response.incomplete"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
