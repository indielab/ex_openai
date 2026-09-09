defmodule ExOpenAI.Components.WebhookEvalRunFailed do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when an eval run has failed.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the eval run failed.
    Format: `unixtime`

  * `:data` - **required** - `%{required(:id) => String.t()}`
    Event data payload.

  * `:id` - **required** - `String.t()`
    The unique ID of the event.

  * `:object` - **optional** - `:event`
    The object of the event. Always `event`.
    Allowed values: `"event"`

  * `:type` - **required** - `:"eval.run.failed"`
    The type of the event. Always `eval.run.failed`.
    Allowed values: `"eval.run.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          created_at: integer(),
          data: %{required(:id) => String.t()},
          id: String.t(),
          object: :event | nil,
          type: :"eval.run.failed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data) => %{required(:id) => String.t()},
              required(:id) => String.t(),
              optional(:object) => :event | String.t(),
              required(:type) => :"eval.run.failed" | String.t()
            }
  defstruct [:created_at, :data, :id, :object, :type]
end
