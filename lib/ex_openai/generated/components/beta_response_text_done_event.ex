defmodule ExOpenAI.Components.BetaResponseTextDoneEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when text content is finalized.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that owns this multi-agent streaming event.

  * `:content_index` - **required** - `integer()`
    The index of the content part that the text content is finalized.

  * `:item_id` - **required** - `String.t()`
    The ID of the output item that the text content is finalized.

  * `:logprobs` - **required** - `list(ExOpenAI.Components.BetaResponseLogProb.t())`
    The log probabilities of the tokens in the delta.

  * `:output_index` - **required** - `integer()`
    The index of the output item that the text content is finalized.

  * `:sequence_number` - **required** - `integer()`
    The sequence number for this event.

  * `:text` - **required** - `String.t()`
    The text content that is finalized.

  * `:type` - **required** - `:"response.output_text.done"`
    The type of the event. Always `response.output_text.done`.
    Allowed values: `"response.output_text.done"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content_index: integer(),
          item_id: String.t(),
          logprobs: list(ExOpenAI.Components.BetaResponseLogProb.t()),
          output_index: integer(),
          sequence_number: integer(),
          text: String.t(),
          type: :"response.output_text.done"
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content_index) => integer(),
              required(:item_id) => String.t(),
              required(:logprobs) => list(ExOpenAI.Components.BetaResponseLogProb.input()),
              required(:output_index) => integer(),
              required(:sequence_number) => integer(),
              required(:text) => String.t(),
              required(:type) => :"response.output_text.done" | String.t()
            }
  defstruct [
    :agent,
    :content_index,
    :item_id,
    :logprobs,
    :output_index,
    :sequence_number,
    :text,
    :type
  ]
end
