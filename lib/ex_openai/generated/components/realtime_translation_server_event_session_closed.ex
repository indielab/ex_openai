defmodule ExOpenAI.Components.RealtimeTranslationServerEventSessionClosed do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a realtime translation session is closed.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:type` - **required** - `:"session.closed"`
    The event type, must be `session.closed`.
    Allowed values: `"session.closed"`
  """
  @type t() :: %{__struct__: __MODULE__, event_id: String.t(), type: :"session.closed"}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:type) => :"session.closed" | String.t()
            }
  defstruct [:event_id, :type]
end
