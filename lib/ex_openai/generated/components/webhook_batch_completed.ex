defmodule ExOpenAI.Components.WebhookBatchCompleted do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a batch API request has been completed.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the batch API request was completed.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"batch.completed"`  
    The type of the event. Always `batch.completed`.  
    Allowed values: `"batch.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"batch.completed"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
