defmodule ExOpenAI.Components.BetaResponseTextDeltaEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when there is an additional text delta.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the content part that the text delta was added to.

  * `:delta` - **required** - `String.t()`
    The text delta that was added.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the text delta was added to.

  * `:logprobs` - **required** - `list(ExOpenAI.Components.BetaResponseLogProb.t())`
    The log probabilities of the tokens in the delta.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the text delta was added to.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:type` - **required** - `:"response.output_text.delta"`
    The type of the event. Always `response.output_text.delta`.
    Allowed values: `"response.output_text.delta"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          delta: String.t(),
          item_id: String.t(),
          logprobs: list(ExOpenAI.Components.BetaResponseLogProb.t()),
          output_index: integer(),
          sequence_number: integer(),
          type: :"response.output_text.delta"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content_index) => integer(),
              required(:delta) => String.t(),
              required(:item_id) => String.t(),
              required(:logprobs) => list(ExOpenAI.Components.BetaResponseLogProb.input()),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:type) => :"response.output_text.delta" | String.t()
            }
  defstruct [
    :agent,
    :content_index,
    :delta,
    :item_id,
    :logprobs,
    :output_index,
    :sequence_number,
    :type
  ]
end
