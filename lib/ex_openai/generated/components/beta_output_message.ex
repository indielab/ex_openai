defmodule ExOpenAI.Components.BetaOutputMessage do
  use ExOpenAI.Jason

  @moduledoc """
  An output message from the model.


  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t() | nil`
    The agent that produced this item.

  * `:content` - **required** - `list(ExOpenAI.Components.BetaOutputMessageContent.t())`
    The content of the output message.

  * `:id` - **required** - `String.t()`
    The unique ID of the output message.

  * `:phase` - **optional** - `ExOpenAI.Components.BetaMessagePhase.t() | nil`

  * `:role` - **required** - `:assistant`
    The role of the output message. Always `assistant`.
    Allowed values: `"assistant"`

  * `:status` - **required** - `:in_progress | :completed | :incomplete`
    The status of the message input. One of `in_progress`, `completed`, or
  `incomplete`. Populated when input items are returned via API.
    Allowed values: `"in_progress"`, `"completed"`, `"incomplete"`

  * `:type` - **required** - `:message`
    The type of the output message. Always `message`.
    Allowed values: `"message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.BetaAgentTag.t() | nil) | nil,
          content: list(ExOpenAI.Components.BetaOutputMessageContent.t()),
          id: String.t(),
          phase: (ExOpenAI.Components.BetaMessagePhase.t() | nil) | nil,
          role: :assistant,
          status: (:in_progress | :completed) | :incomplete,
          type: :message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input() | nil,
              required(:content) => list(ExOpenAI.Components.BetaOutputMessageContent.input()),
              required(:id) => String.t(),
              optional(:phase) => ExOpenAI.Components.BetaMessagePhase.input() | nil,
              required(:role) => :assistant | String.t(),
              required(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:type) => :message | String.t()
            }
  defstruct [:agent, :content, :id, :phase, :role, :status, :type]
end
