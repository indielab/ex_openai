defmodule ExOpenAI.Components.BetaResponseFunctionCallArgumentsDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is a partial function-call arguments delta.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

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
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.function_call_arguments.delta"
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
              required(:type) => :"response.function_call_arguments.delta" | String.t()
            }
  defstruct [:agent, :delta, :item_id, :output_index, :sequence_number, :type]
end
