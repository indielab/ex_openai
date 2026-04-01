defmodule ExOpenAI.Components.WebhookResponseCompleted do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a background response has been completed.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the model response was completed.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"response.completed"`  
    The type of the event. Always `response.completed`.  
    Allowed values: `"response.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"response.completed"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
