defmodule ExOpenAI.Components.ResponseCodeInterpreterCallCodeDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the code snippet is finalized by the code interpreter.

  ## Fields

  * `:code` - **required** - `String.t()`
    The final code snippet output by the code interpreter.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the code interpreter tool call item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response for which the code is finalized.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event, used to order streaming events.

  * `:type` - **required** - `:"response.code_interpreter_call_code.done"`
    The type of the event. Always `response.code_interpreter_call_code.done`.
    Allowed values: `"response.code_interpreter_call_code.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          code: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call_code.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:code) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.code_interpreter_call_code.done" | String.t()
            }
  defstruct [:code, :item_id, :output_index, :sequence_number, :type]
end
