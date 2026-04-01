defmodule ExOpenAI.Components.ResponseCodeInterpreterCallCodeDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a partial code snippet is streamed by the code interpreter.

  ## Fields

  * `:delta` - **required** - `String.t()`  
    The partial code snippet being streamed by the code interpreter.

  * `:item_id` - **required** - `String.t()`  
    The unique identifier of the code interpreter tool call item.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response for which the code is being streamed.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event, used to order streaming events.

  * `:type` - **required** - `:"response.code_interpreter_call_code.delta"`  
    The type of the event. Always `response.code_interpreter_call_code.delta`.  
    Allowed values: `"response.code_interpreter_call_code.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call_code.delta"
        }
  defstruct [:delta, :item_id, :output_index, :sequence_number, :type]
end
