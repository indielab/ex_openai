defmodule ExOpenAI.Components.FineTuningJobEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Fine-tuning job event object

  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) for when the fine-tuning job was created.

  * `:data` - **optional** - `map()`  
    The data associated with the event.

  * `:id` - **required** - `String.t()`  
    The object identifier.

  * `:level` - **required** - `:info | :warn | :error`  
    The log level of the event.  
    Allowed values: `"info"`, `"warn"`, `"error"`

  * `:message` - **required** - `String.t()`  
    The message of the event.

  * `:object` - **required** - `:"fine_tuning.job.event"`  
    The object type, which is always "fine_tuning.job.event".  
    Allowed values: `"fine_tuning.job.event"`

  * `:type` - **optional** - `:message | :metrics`  
    The type of event.  
    Allowed values: `"message"`, `"metrics"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: map() | nil,
          id: String.t(),
          level: (:info | :warn) | :error,
          message: String.t(),
          object: :"fine_tuning.job.event",
          type: (:message | :metrics) | nil
        }
  defstruct [:created_at, :data, :id, :level, :message, :object, :type]
end
