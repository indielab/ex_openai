defmodule ExOpenAI.Components.BetaResponseContentPartAddedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a new content part is added.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the content part that was added.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the content part was added to.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the content part was added to.

  * `:part` - **required** - `ExOpenAI.Components.BetaOutputContent.t()`
    The content part that was added.

  * `:sequence_number` - **required** - `integer()`
    The sequence number of this event.

  * `:type` - **required** - `:"response.content_part.added"`
    The type of the event. Always `response.content_part.added`.
    Allowed values: `"response.content_part.added"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          item_id: String.t(),
          output_index: integer(),
          part: ExOpenAI.Components.BetaOutputContent.t(),
          sequence_number: integer(),
          type: :"response.content_part.added"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:output_index) => integer(),
              required(:part) => ExOpenAI.Components.BetaOutputContent.input(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.content_part.added" | String.t()
            }
  defstruct [:agent, :content_index, :item_id, :output_index, :part, :sequence_number, :type]
end
