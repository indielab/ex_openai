defmodule ExOpenAI.Components.RealtimeServerEventError do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when an error occurs, which could be a client problem or a server
  problem. Most errors are recoverable and the session will stay open, we
  recommend to implementors to monitor and log error messages by default.


  ## Fields

  * `:error` - **required** - `%{ optional(:code) => String.t() | nil, optional(:event_id) => String.t() | nil, required(:message) => String.t(), optional(:param) => String.t() | nil, required(:type) => String.t() }`
    Details of the error.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:type` - **required** - `:error`
    The event type, must be `error`.
    Allowed values: `"error"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          error: %{
            optional(:code) => String.t() | nil,
            optional(:event_id) => String.t() | nil,
            required(:message) => String.t(),
            optional(:param) => String.t() | nil,
            required(:type) => String.t()
          },
          event_id: String.t(),
          type: :error
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:error) => %{
                optional(:code) => String.t() | nil,
                optional(:event_id) => String.t() | nil,
                required(:message) => String.t(),
                optional(:param) => String.t() | nil,
                required(:type) => String.t()
              },
              required(:event_id) => String.t(),
              required(:type) => :error | String.t()
            }
  defstruct [:error, :event_id, :type]
end
