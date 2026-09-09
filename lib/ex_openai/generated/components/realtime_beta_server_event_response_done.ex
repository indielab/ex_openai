defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a Response is done streaming. Always emitted, no matter the
  final state. The Response object included in the `response.done` event will
  include all output Items in the Response but will omit the raw audio data.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:response` - **required** - `ExOpenAI.Components.RealtimeBetaResponse.t()`

  * `:type` - **required** - `:"response.done"`
    The event type, must be `response.done`.
    Allowed values: `"response.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          response: ExOpenAI.Components.RealtimeBetaResponse.t(),
          type: :"response.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:response) => ExOpenAI.Components.RealtimeBetaResponse.input(),
              required(:type) => :"response.done" | String.t()
            }
  defstruct [:event_id, :response, :type]
end
