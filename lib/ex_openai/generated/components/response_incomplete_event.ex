defmodule ExOpenAI.Components.ResponseIncompleteEvent do
  use ExOpenAI.Jason

  @moduledoc """
  An event that is emitted when a response finishes as incomplete.


  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    The response that was incomplete.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.incomplete"`  
    The type of the event. Always `response.incomplete`.  
    Allowed values: `"response.incomplete"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.incomplete"
        }
  defstruct [:response, :sequence_number, :type]
end
