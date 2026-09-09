defmodule ExOpenAI.Components.ResponseCustomToolCallInputDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Event indicating that input for a custom tool call is complete.


  ## Fields

  * `:input` - **required** - `String.t()`
    The complete input data for the custom tool call.

  * `:item_id` - **required** - `String.t()`
    Unique identifier for the API item associated with this event.

  * `:output_index` - **required** - `integer()`
    The index of the output this event applies to.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.custom_tool_call_input.done"`
    The event type identifier.
    Allowed values: `"response.custom_tool_call_input.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.custom_tool_call_input.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:input) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.custom_tool_call_input.done" | String.t()
            }
  defstruct [:input, :item_id, :output_index, :sequence_number, :type]
end
