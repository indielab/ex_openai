defmodule ExOpenAI.Components.WebhookBatchExpired do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a batch API request has expired.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the batch API request expired.
    Format: `unixtime`

  * `:data` - **required** - `%{required(:id) => String.t()}`
    Event data payload.

  * `:id` - **required** - `String.t()`
    The unique ID of the event.

  * `:object` - **optional** - `:event`
    The object of the event. Always `event`.
    Allowed values: `"event"`

  * `:type` - **required** - `:"batch.expired"`
    The type of the event. Always `batch.expired`.
    Allowed values: `"batch.expired"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"batch.expired"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data) => %{required(:id) => String.t()},
              required(:id) => String.t(),
              optional(:object) => :event | String.t(),
              required(:type) => :"batch.expired" | String.t()
            }
  defstruct [:created_at, :data, :id, :object, :type]
end
