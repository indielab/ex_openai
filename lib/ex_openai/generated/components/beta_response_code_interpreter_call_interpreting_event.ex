defmodule ExOpenAI.Components.BetaResponseCodeInterpreterCallInterpretingEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when the code interpreter is actively interpreting the code snippet.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item_id` - **required** - `String.t()`
    The unique identifier of the code interpreter tool call item.

  * `:output_index` - **required** - `integer()`
    The index of the output item in the response for which the code interpreter is interpreting code.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event, used to order streaming events.

  * `:type` - **required** - `:"response.code_interpreter_call.interpreting"`
    The type of the event. Always `response.code_interpreter_call.interpreting`.
    Allowed values: `"response.code_interpreter_call.interpreting"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call.interpreting"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.code_interpreter_call.interpreting" | String.t()
            }
  defstruct [:agent, :item_id, :output_index, :sequence_number, :type]
end
