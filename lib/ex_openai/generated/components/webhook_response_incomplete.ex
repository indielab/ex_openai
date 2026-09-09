defmodule ExOpenAI.Components.WebhookResponseIncomplete do
  use ExOpenAI.Jason

  @moduledoc """
  Sent when a background response has been interrupted.


  ## Fields

  * `:created_at` - **required** - `integer()`
    The Unix timestamp (in seconds) of when the model response was interrupted.
    Format: `unixtime`

  * `:data` - **required** - `%{required(:id) => String.t()}`
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
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:created_at) => integer(),
              required(:data) => %{required(:id) => String.t()},
              required(:id) => String.t(),
              optional(:object) => :event | String.t(),
              required(:type) => :"response.incomplete" | String.t()
            }
  defstruct [:created_at, :data, :id, :object, :type]
end
