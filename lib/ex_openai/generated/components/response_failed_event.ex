defmodule ExOpenAI.Components.ResponseFailedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  An event that is emitted when a response fails.


  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    The response that failed.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.failed"`  
    The type of the event. Always `response.failed`.  
    Allowed values: `"response.failed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.failed"
        }
  defstruct [:response, :sequence_number, :type]
end
