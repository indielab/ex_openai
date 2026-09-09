defmodule ExOpenAI.Components.RealtimeTranslationServerEventSessionUpdated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a translation session is updated with a `session.update` event,
  unless there is an error.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:session` - **required** - `ExOpenAI.Components.RealtimeTranslationSession.t()`
    The translation session configuration.

  * `:type` - **required** - `:"session.updated"`
    The event type, must be `session.updated`.
    Allowed values: `"session.updated"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          session: ExOpenAI.Components.RealtimeTranslationSession.t(),
          type: :"session.updated"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:session) => ExOpenAI.Components.RealtimeTranslationSession.input(),
              required(:type) => :"session.updated" | String.t()
            }
  defstruct [:event_id, :session, :type]
end
