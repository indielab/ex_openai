defmodule ExOpenAI.Components.RealtimeClientEventResponseCancel do
  use ExOpenAI.Jason

  @moduledoc """
  Send this event to cancel an in-progress response. The server will respond
  with a `response.done` event with a status of `response.status=cancelled`. If
  there is no response to cancel, the server will respond with an error. It's safe
  to call `response.cancel` even if no response is in progress, an error will be
  returned the session will remain unaffected.


  ## Fields

  * `:event_id` - **optional** - `String.t()`
    Optional client-generated ID used to identify this event.
    Constraints: maxLength: 512

  * `:response_id` - **optional** - `String.t()`
    A specific response ID to cancel - if not provided, will cancel an
  in-progress response in the default conversation.

  * `:type` - **required** - `:"response.cancel"`
    The event type, must be `response.cancel`.
    Allowed values: `"response.cancel"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t() | nil,
          response_id: String.t() | nil,
          type: :"response.cancel"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:event_id) => String.t(),
              optional(:response_id) => String.t(),
              required(:type) => :"response.cancel" | String.t()
            }
  defstruct [:event_id, :response_id, :type]
end
