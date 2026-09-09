defmodule ExOpenAI.Components.BetaReasoningItem do
  use ExOpenAI.Jason

  @moduledoc """
  A description of the chain of thought used by a reasoning model while generating
  a response. Be sure to include these items in your `input` to the Responses API
  for subsequent turns of a conversation if you are manually
  [managing context](https://platform.openai.com/docs/guides/conversation-state).


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:content` - **optional** - `list(ExOpenAI.Components.BetaReasoningTextContent.t())`
    Reasoning text content.

  * `:encrypted_content` - **optional** - `String.t() | nil`

  * `:id` - **required** - `String.t()`
    The unique identifier of the reasoning content.

  * `:status` - **optional** - `:in_progress | :completed | :incomplete`
    The status of the item. One of `in_progress`, `completed`, or
  `incomplete`. Populated when items are returned via API.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:summary` - **required** - `list(ExOpenAI.Components.BetaSummaryTextContent.t())`
    Reasoning summary content.

  * `:type` - **required** - `:reasoning`
    The type of the object. Always `reasoning`.
    Allowed values: `"reasoning"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content: list(ExOpenAI.Components.BetaReasoningTextContent.t()) | nil,
          encrypted_content: (String.t() | nil) | nil,
          id: String.t(),
          status: ((:in_progress | :completed) | :incomplete) | nil,
          summary: list(ExOpenAI.Components.BetaSummaryTextContent.t()),
          type: :reasoning
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              optional(:content) => list(ExOpenAI.Components.BetaReasoningTextContent.input()),
              optional(:encrypted_content) => String.t() | nil,
              required(:id) => String.t(),
              optional(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:summary) => list(ExOpenAI.Components.BetaSummaryTextContent.input()),
              required(:type) => :reasoning | String.t()
            }
  defstruct [:agent, :content, :encrypted_content, :id, :status, :summary, :type]
end
