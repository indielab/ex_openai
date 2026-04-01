defmodule ExOpenAI.Components.Message do
  use ExOpenAI.Jason

  @moduledoc """
  A message to or from the model.

  ## Fields

  * `:content` - **required** - `[ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.TextContent.t() | ExOpenAI.Components.SummaryTextContent.t() | ExOpenAI.Components.ReasoningTextContent.t() | ExOpenAI.Components.RefusalContent.t() | ExOpenAI.Components.InputImageContent.t() | ExOpenAI.Components.ComputerScreenshotContent.t() | ExOpenAI.Components.InputFileContent.t()]`  
    The content of the message

  * `:id` - **required** - `String.t()`  
    The unique ID of the message.

  * `:phase` - **optional** - `:"Elixir.ExOpenAI.Components.MessagePhase-2".t() | any()`

  * `:role` - **required** - `ExOpenAI.Components.MessageRole.t()`  
    The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.

  * `:status` - **required** - `ExOpenAI.Components.MessageStatus.t()`  
    The status of item. One of `in_progress`, `completed`, or `incomplete`. Populated when items are returned via API.

  * `:type` - **required** - `:message`  
    The type of the message. Always set to `message`.  
    Allowed values: `"message"`  
    Default: `"message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          content:
            list(
              (((((((ExOpenAI.Components.InputTextContent.t()
                     | ExOpenAI.Components.OutputTextContent.t())
                    | ExOpenAI.Components.TextContent.t())
                   | ExOpenAI.Components.SummaryTextContent.t())
                  | ExOpenAI.Components.ReasoningTextContent.t())
                 | ExOpenAI.Components.RefusalContent.t())
                | ExOpenAI.Components.InputImageContent.t())
               | ExOpenAI.Components.ComputerScreenshotContent.t())
              | ExOpenAI.Components.InputFileContent.t()
            ),
          id: String.t(),
          phase: (:"Elixir.ExOpenAI.Components.MessagePhase-2".t() | any()) | nil,
          role: ExOpenAI.Components.MessageRole.t(),
          status: ExOpenAI.Components.MessageStatus.t(),
          type: :message
        }
  defstruct [:content, :id, :phase, :role, :status, :type]
end
