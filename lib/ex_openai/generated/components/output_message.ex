defmodule ExOpenAI.Components.OutputMessage do
  use ExOpenAI.Jason

  @moduledoc """
  An output message from the model.


  ## Fields

  * `:content` - **required** - `list(ExOpenAI.Components.OutputMessageContent.t())`
    The content of the output message.

  * `:id` - **required** - `String.t()`
    The unique ID of the output message.

  * `:phase` - **optional** - `ExOpenAI.Components.MessagePhase.t() | nil`

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
          content: list(ExOpenAI.Components.OutputMessageContent.t()),
          id: String.t(),
          phase: (ExOpenAI.Components.MessagePhase.t() | nil) | nil,
          role: :assistant,
          status: (:in_progress | :completed) | :incomplete,
          type: :message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) => list(ExOpenAI.Components.OutputMessageContent.input()),
              required(:id) => String.t(),
              optional(:phase) => ExOpenAI.Components.MessagePhase.input() | nil,
              required(:role) => :assistant | String.t(),
              required(:status) => ((:in_progress | :completed) | :incomplete) | String.t(),
              required(:type) => :message | String.t()
            }
  defstruct [:content, :id, :phase, :role, :status, :type]
end
