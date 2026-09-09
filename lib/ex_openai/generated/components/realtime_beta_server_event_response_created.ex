defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseCreated do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when a new Response is created. The first event of response creation,
  where the response is in an initial state of `in_progress`.


  ## Fields

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:response` - **required** - `ExOpenAI.Components.RealtimeBetaResponse.t()`

  * `:type` - **required** - `:"response.created"`
    The event type, must be `response.created`.
    Allowed values: `"response.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          event_id: String.t(),
          response: ExOpenAI.Components.RealtimeBetaResponse.t(),
          type: :"response.created"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:event_id) => String.t(),
              required(:response) => ExOpenAI.Components.RealtimeBetaResponse.input(),
              required(:type) => :"response.created" | String.t()
            }
  defstruct [:event_id, :response, :type]
end
