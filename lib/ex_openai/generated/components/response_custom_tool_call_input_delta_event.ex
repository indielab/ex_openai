defmodule ExOpenAI.Components.ResponseCustomToolCallInputDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Event representing a delta (partial update) to the input of a custom tool call.


  ## Fields

  * `:delta` - **required** - `String.t()`  
    The incremental input data (delta) for the custom tool call.

  * `:item_id` - **required** - `String.t()`  
    Unique identifier for the API item associated with this event.

  * `:output_index` - **required** - `integer()`  
    The index of the output this delta applies to.

  * `:sequence_number` - **required** - `integer()`  
    The sequence number of this event.

  * `:type` - **required** - `:"response.custom_tool_call_input.delta"`  
    The event type identifier.  
    Allowed values: `"response.custom_tool_call_input.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.custom_tool_call_input.delta"
        }
  defstruct [:delta, :item_id, :output_index, :sequence_number, :type]
end
