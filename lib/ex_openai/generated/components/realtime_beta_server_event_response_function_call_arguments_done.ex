defmodule ExOpenAI.Components.RealtimeBetaServerEventResponseFunctionCallArgumentsDone do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the model-generated function call arguments are done streaming.
  Also emitted when a Response is interrupted, incomplete, or cancelled.


  ## Fields

  * `:arguments` - **required** - `String.t()`  
    The final arguments as a JSON string.

  * `:call_id` - **required** - `String.t()`  
    The ID of the function call.

  * `:event_id` - **required** - `String.t()`  
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`  
    The ID of the function call item.

  * `:name` - **required** - `String.t()`  
    The name of the function that was called.

  * `:output_index` - **required** - `integer()`  
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`  
    The ID of the response.

  * `:type` - **required** - `:"response.function_call_arguments.done"`  
    The event type, must be `response.function_call_arguments.done`.  
    Allowed values: `"response.function_call_arguments.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t(),
          call_id: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          name: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.function_call_arguments.done"
        }
  defstruct [:arguments, :call_id, :event_id, :item_id, :name, :output_index, :response_id, :type]
end
