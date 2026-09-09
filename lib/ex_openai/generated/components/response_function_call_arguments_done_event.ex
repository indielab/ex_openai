defmodule ExOpenAI.Components.ResponseFunctionCallArgumentsDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when function-call arguments are finalized.

  ## Fields

  * `:arguments` - **required** - `String.t()`
    The function-call arguments.

  * `:item_id` - **required** - `String.t()`
    The ID of the item.

  * `:name` - **required** - `String.t()`
    The name of the function that was called.

  * `:output_index` - **required** - `integer()`
    The index of the output item.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.function_call_arguments.done"`
    Allowed values: `"response.function_call_arguments.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          arguments: String.t(),
          item_id: String.t(),
          name: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.function_call_arguments.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:arguments) => String.t(),
              required(:item_id) => String.t(),
              required(:name) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.function_call_arguments.done" | String.t()
            }
  defstruct [:arguments, :item_id, :name, :output_index, :sequence_number, :type]
end
