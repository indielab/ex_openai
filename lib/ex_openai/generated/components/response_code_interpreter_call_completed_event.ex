defmodule ExOpenAI.Components.ResponseCodeInterpreterCallCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the code interpreter call is completed.

  ## Fields

  * `:item_id` - **required** - `String.t()`  
    The unique identifier of the code interpreter tool call item.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response for which the code interpreter call is completed.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event, used to order streaming events.

  * `:type` - **required** - `:"response.code_interpreter_call.completed"`  
    The type of the event. Always `response.code_interpreter_call.completed`.  
    Allowed values: `"response.code_interpreter_call.completed"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call.completed"
        }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
