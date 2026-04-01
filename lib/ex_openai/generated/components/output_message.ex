defmodule ExOpenAI.Components.OutputMessage do
  use ExOpenAI.Jason

  @moduledoc """
  An output message from the model.


  ## Fields

  * `:content` - **required** - `[ExOpenAI.Components.OutputMessageContent.t()]`  
    The content of the output message.

  * `:id` - **required** - `String.t()`  
    The unique ID of the output message.

  * `:phase` - **optional** - `ExOpenAI.Components.MessagePhase.t() | any()`

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
          phase: (ExOpenAI.Components.MessagePhase.t() | any()) | nil,
          role: :assistant,
          status: (:in_progress | :completed) | :incomplete,
          type: :message
        }
  defstruct [:content, :id, :phase, :role, :status, :type]
end
