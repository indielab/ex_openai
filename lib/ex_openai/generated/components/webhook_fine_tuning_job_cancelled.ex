defmodule ExOpenAI.Components.WebhookFineTuningJobCancelled do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a fine-tuning job has been cancelled.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the fine-tuning job was cancelled.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"fine_tuning.job.cancelled"`  
    The type of the event. Always `fine_tuning.job.cancelled`.  
    Allowed values: `"fine_tuning.job.cancelled"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"fine_tuning.job.cancelled"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
