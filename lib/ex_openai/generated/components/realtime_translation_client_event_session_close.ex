defmodule ExOpenAI.Components.RealtimeTranslationClientEventSessionClose do
  use ExOpenAI.Jason

  @moduledoc """
  Gracefully close the realtime translation session. The server flushes pending
  input audio and emits any remaining translated output before closing the
  session.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:type` - **required** - `:"session.close"`
    The event type, must be `session.close`.
    Allowed values: `"session.close"`
  """
  @type t() :: %{__struct__: __MODULE__, event_id: String.t() | nil, type: :"session.close"}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{optional(:event_id) => String.t(), required(:type) => :"session.close" | String.t()}
  defstruct [:event_id, :type]
end
