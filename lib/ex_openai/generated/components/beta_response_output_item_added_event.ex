defmodule ExOpenAI.Components.BetaResponseOutputItemAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new output item is added.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:item` - **required** - `ExOpenAI.Components.BetaOutputItem.t()`
    The output item that was added.

  * `:output_index` - **required** - `integer()`
    The index of the output item that was added.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.output_item.added"`
    The type of the event. Always `response.output_item.added`.
    Allowed values: `"response.output_item.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          item: ExOpenAI.Components.BetaOutputItem.t(),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_item.added"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:item) => ExOpenAI.Components.BetaOutputItem.input(),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.output_item.added" | String.t()
            }
  defstruct [:agent, :item, :output_index, :sequence_number, :type]
end
