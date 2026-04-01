defmodule ExOpenAI.Components.WebhookEvalRunSucceeded do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when an eval run has succeeded.


  ## Fields

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the eval run succeeded.

  * `:data` - **required** - `{:%{}, [], [{{:required, [], [:id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
    Event data payload.

  * `:id` - **required** - `String.t()`  
    The unique ID of the event.

  * `:object` - **optional** - `:event`  
    The object of the event. Always `event`.  
    Allowed values: `"event"`

  * `:type` - **required** - `:"eval.run.succeeded"`  
    The type of the event. Always `eval.run.succeeded`.  
    Allowed values: `"eval.run.succeeded"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"eval.run.succeeded"
        }
  defstruct [:created_at, :data, :id, :object, :type]
end
