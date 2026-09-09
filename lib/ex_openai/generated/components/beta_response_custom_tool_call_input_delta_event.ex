defmodule ExOpenAI.Components.BetaResponseCustomToolCallInputDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Event representing a delta (partial update) to the input of a custom tool call.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

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
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          delta: String.t(),
          item_id: String.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.custom_tool_call_input.delta"
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
              required(:type) => :"response.custom_tool_call_input.delta" | String.t()
            }
  defstruct [:agent, :delta, :item_id, :output_index, :sequence_number, :type]
end
