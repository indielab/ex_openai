defmodule ExOpenAI.Components.Message do
  use ExOpenAI.Jason

  @moduledoc """
  A message to or from the model.

  ## Fields

  * `:content` - **required** - `list( ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.TextContent.t() | ExOpenAI.Components.SummaryTextContent.t() | ExOpenAI.Components.ReasoningTextContent.t() | ExOpenAI.Components.RefusalContent.t() | ExOpenAI.Components.InputImageContent.t() | ExOpenAI.Components.ComputerScreenshotContent.t() | ExOpenAI.Components.InputFileContent.t() )`
    The content of the message

  * `:id` - **required** - `String.t()`
    The unique ID of the message.

  * `:phase` - **optional** - `:"Elixir.ExOpenAI.Components.MessagePhase-2".t() | nil`

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
          phase: (:"Elixir.ExOpenAI.Components.MessagePhase-2".t() | nil) | nil,
          role: ExOpenAI.Components.MessageRole.t(),
          status: ExOpenAI.Components.MessageStatus.t(),
          type: :message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:content) =>
                list(
                  (((((((ExOpenAI.Components.InputTextContent.input()
                         | ExOpenAI.Components.OutputTextContent.input())
                        | ExOpenAI.Components.TextContent.input())
                       | ExOpenAI.Components.SummaryTextContent.input())
                      | ExOpenAI.Components.ReasoningTextContent.input())
                     | ExOpenAI.Components.RefusalContent.input())
                    | ExOpenAI.Components.InputImageContent.input())
                   | ExOpenAI.Components.ComputerScreenshotContent.input())
                  | ExOpenAI.Components.InputFileContent.input()
                ),
              required(:id) => String.t(),
              optional(:phase) => :"Elixir.ExOpenAI.Components.MessagePhase-2".input() | nil,
              required(:role) => ExOpenAI.Components.MessageRole.input(),
              required(:status) => ExOpenAI.Components.MessageStatus.input(),
              required(:type) => :message | String.t()
            }
  defstruct [:content, :id, :phase, :role, :status, :type]
end
