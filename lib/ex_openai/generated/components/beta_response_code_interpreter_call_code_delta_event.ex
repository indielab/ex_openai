defmodule ExOpenAI.Components.BetaResponseCodeInterpreterCallCodeDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a partial code snippet is streamed by the code interpreter.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

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
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.code_interpreter_call_code.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:delta) => String.t(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.code_interpreter_call_code.delta" | String.t()
            }
  defstruct [:agent, :delta, :item_id, :output_index, :sequence_number, :type]
end
