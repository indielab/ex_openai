defmodule ExOpenAI.Components.ResponseCreatedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  An event that is emitted when a response is created.


  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    The response that was created.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number for this event.

  * `:type` - **required** - `:"response.created"`  
    The type of the event. Always `response.created`.  
    Allowed values: `"response.created"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.created"
        }
  defstruct [:response, :sequence_number, :type]
end
