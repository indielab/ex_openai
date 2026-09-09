defmodule ExOpenAI.Components.BetaResponseInjectFailedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when injected input could not be committed to a response. The event
  returns the uncommitted raw input so the client can retry it in another
  response when appropriate.


  ## Fields

  * `:error` - **required** - `%{ required(:code) => :response_already_completed | :response_not_found, required(:message) => String.t() }`
    Information about why the input was not committed.

  * `:input` - **required** - `list(ExOpenAI.Components.BetaInputItem.t())`
    The raw input items that were not committed.

  * `:response_id` - **required** - `String.t()`
    The ID of the response that rejected the input.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:stream_id` - **optional** - `String.t()`
    The multiplexed WebSocket stream that emitted the event. This field is
  present only when WebSocket multiplexing is enabled separately.

  * `:type` - **required** - `:"response.inject.failed"`
    The event discriminator. Always `response.inject.failed`.
    Allowed values: `"response.inject.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          error: %{
            required(:code) => :response_already_completed | :response_not_found,
            required(:message) => String.t()
          },
          input: list(ExOpenAI.Components.BetaInputItem.t()),
          response_id: String.t(),
          sequence_number: integer(),
          stream_id: String.t() | nil,
          type: :"response.inject.failed"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:error) => %{
                required(:code) =>
                  (:response_already_completed | :response_not_found) | String.t(),
                required(:message) => String.t()
              },
              required(:input) => list(ExOpenAI.Components.BetaInputItem.input()),
              required(:response_id) => String.t(),
              required(:sequence_number) => integer(),
              optional(:stream_id) => String.t(),
              required(:type) => :"response.inject.failed" | String.t()
            }
  defstruct [:error, :input, :response_id, :sequence_number, :stream_id, :type]
end
