defmodule ExOpenAI.Components.ResponseQueuedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a response is queued and waiting to be processed.


  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    The full response object that is queued.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number for this event.

  * `:type` - **required** - `:"response.queued"`  
    The type of the event. Always 'response.queued'.  
    Allowed values: `"response.queued"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.queued"
        }
  defstruct [:response, :sequence_number, :type]
end
