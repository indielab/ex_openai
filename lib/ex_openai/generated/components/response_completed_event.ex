defmodule ExOpenAI.Components.ResponseCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the model response is complete.

  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    Properties of the completed response.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number for this event.

  * `:type` - **required** - `:"response.completed"`  
    The type of the event. Always `response.completed`.  
    Allowed values: `"response.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.completed"
        }
  defstruct [:response, :sequence_number, :type]
end
