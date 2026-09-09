defmodule ExOpenAI.Components.ResponseCodeInterpreterCallInProgressEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a code interpreter call is in progress.

  ## Fields

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the code interpreter tool call item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response for which the code interpreter call is in progress.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event, used to order streaming events.

  * `:type` - **required** - `:"response.code_interpreter_call.in_progress"`
    The type of the event. Always `response.code_interpreter_call.in_progress`.
    Allowed values: `"response.code_interpreter_call.in_progress"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call.in_progress"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.code_interpreter_call.in_progress" | String.t()
            }
  defstruct [:item_id, :output_index, :sequence_number, :type]
end
