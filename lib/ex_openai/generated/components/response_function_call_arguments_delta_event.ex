defmodule ExOpenAI.Components.ResponseFunctionCallArgumentsDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial function-call arguments delta.

  ## Fields

  * `:delta` - **required** - `String.t()`  
    The function-call arguments delta that is added.

  * `:item_id` - **required** - `String.t()`  
    The ID of the output item that the function-call arguments delta is added to.

  * `:output_index` - **required** - `integer()`  
    The index of the output item that the function-call arguments delta is added to.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.function_call_arguments.delta"`  
    The type of the event. Always `response.function_call_arguments.delta`.  
    Allowed values: `"response.function_call_arguments.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.function_call_arguments.delta"
        }
  defstruct [:delta, :item_id, :output_index, :sequence_number, :type]
end
