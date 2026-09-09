defmodule ExOpenAI.Components.BetaResponseOutputItemDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when an output item is marked done.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item` - **required** - `ExOpenAI.Components.BetaOutputItem.t()`
    The output item that was marked done.

  * `:output_index` - **required** - `integer()`
    The index of the output item that was marked done.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.output_item.done"`
    The type of the event. Always `response.output_item.done`.
    Allowed values: `"response.output_item.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item: ExOpenAI.Components.BetaOutputItem.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_item.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item) => ExOpenAI.Components.BetaOutputItem.input(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.output_item.done" | String.t()
            }
  defstruct [:agent, :item, :output_index, :sequence_number, :type]
end
