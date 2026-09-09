defmodule ExOpenAI.Components.BetaResponseInjectCreatedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when all injected input items were validated and committed to the
  active response.


  ## Fields

  * `:response_id` - **required** - `String.t()`
    The ID of the response that accepted the input.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:stream_id` - **optional** - `String.t()`
    The multiplexed WebSocket stream that emitted the event. This field is
  present only when WebSocket multiplexing is enabled separately.

  * `:type` - **required** - `:"response.inject.created"`
    The event discriminator. Always `response.inject.created`.
    Allowed values: `"response.inject.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response_id: String.t(),
          sequence_number: integer(),
          stream_id: String.t() | nil,
          type: :"response.inject.created"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:response_id) => String.t(),
              required(:sequence_number) => integer(),
              optional(:stream_id) => String.t(),
              required(:type) => :"response.inject.created" | String.t()
            }
  defstruct [:response_id, :sequence_number, :stream_id, :type]
end
