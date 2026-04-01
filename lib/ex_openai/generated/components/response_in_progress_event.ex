defmodule ExOpenAI.Components.ResponseInProgressEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the response is in progress.

  ## Fields

  * `:response` - **required** - `ExOpenAI.Components.Response.t()`  
    The response that is in progress.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.in_progress"`  
    The type of the event. Always `response.in_progress`.  
    Allowed values: `"response.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          response: ExOpenAI.Components.Response.t(),
          sequence_number: integer(),
          type: :"response.in_progress"
        }
  defstruct [:response, :sequence_number, :type]
end
