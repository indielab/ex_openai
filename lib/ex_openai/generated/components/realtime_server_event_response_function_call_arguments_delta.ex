defmodule ExOpenAI.Components.RealtimeServerEventResponseFunctionCallArgumentsDelta do
  use ExOpenAI.Jason

  @moduledoc """
  Returned when the model-generated function call arguments are updated.


  ## Fields

  * `:call_id` - **required** - `String.t()`
    The ID of the function call.

  * `:delta` - **required** - `String.t()`
    The arguments delta as a JSON string.

  * `:event_id` - **required** - `String.t()`
    The unique ID of the server event.

  * `:item_id` - **required** - `String.t()`
    The ID of the function call item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response.

  * `:response_id` - **required** - `String.t()`
    The ID of the response.

  * `:type` - **required** - `:"response.function_call_arguments.delta"`
    The event type, must be `response.function_call_arguments.delta`.
    Allowed values: `"response.function_call_arguments.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          call_id: String.t(),
          delta: String.t(),
          event_id: String.t(),
          item_id: String.t(),
          output_index: integer(),
          response_id: String.t(),
          type: :"response.function_call_arguments.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:call_id) => String.t(),
              required(:delta) => String.t(),
              required(:event_id) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:response_id) => String.t(),
              required(:type) => :"response.function_call_arguments.delta" | String.t()
            }
  defstruct [:call_id, :delta, :event_id, :item_id, :output_index, :response_id, :type]
end
