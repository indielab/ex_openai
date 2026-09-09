defmodule ExOpenAI.Components.BetaMessage do
  use ExOpenAI.Jason

  @moduledoc """
  A message to or from the model.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:content` - **required** - `list( ExOpenAI.Components.BetaInputTextContent.t() | ExOpenAI.Components.BetaOutputTextContent.t() | ExOpenAI.Components.BetaTextContent.t() | ExOpenAI.Components.BetaSummaryTextContent.t() | ExOpenAI.Components.BetaReasoningTextContent.t() | ExOpenAI.Components.BetaRefusalContent.t() | ExOpenAI.Components.BetaInputImageContent.t() | ExOpenAI.Components.BetaComputerScreenshotContent.t() | ExOpenAI.Components.BetaInputFileContent.t() | ExOpenAI.Components.BetaEncryptedContent.t() )`
    The content of the message

  * `:id` - **required** - `String.t()`
    The unique ID of the message.

  * `:phase` - **optional** - `:"Elixir.ExOpenAI.Components.BetaMessagePhase-2".t() | nil`

  * `:role` - **required** - `ExOpenAI.Components.BetaMessageRole.t()`
    The role of the message. One of `unknown`, `user`, `assistant`, `system`, `critic`, `discriminator`, `developer`, or `tool`.

  * `:status` - **required** - `ExOpenAI.Components.BetaMessageStatus.t()`
    The status of item. One of `in_progress`, `completed`, or `incomplete`. Populated when items are returned via API.

  * `:type` - **required** - `:message`
    The type of the message. Always set to `message`.
    Allowed values: `"message"`
    Default: `"message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          content:
            list(
              ((((((((ExOpenAI.Components.BetaInputTextContent.t()
                      | ExOpenAI.Components.BetaOutputTextContent.t())
                     | ExOpenAI.Components.BetaTextContent.t())
                    | ExOpenAI.Components.BetaSummaryTextContent.t())
                   | ExOpenAI.Components.BetaReasoningTextContent.t())
                  | ExOpenAI.Components.BetaRefusalContent.t())
                 | ExOpenAI.Components.BetaInputImageContent.t())
                | ExOpenAI.Components.BetaComputerScreenshotContent.t())
               | ExOpenAI.Components.BetaInputFileContent.t())
              | ExOpenAI.Components.BetaEncryptedContent.t()
            ),
          id: String.t(),
          phase: (:"Elixir.ExOpenAI.Components.BetaMessagePhase-2".t() | nil) | nil,
          role: ExOpenAI.Components.BetaMessageRole.t(),
          status: ExOpenAI.Components.BetaMessageStatus.t(),
          type: :message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:content) =>
                list(
                  ((((((((ExOpenAI.Components.BetaInputTextContent.input()
                          | ExOpenAI.Components.BetaOutputTextContent.input())
                         | ExOpenAI.Components.BetaTextContent.input())
                        | ExOpenAI.Components.BetaSummaryTextContent.input())
                       | ExOpenAI.Components.BetaReasoningTextContent.input())
                      | ExOpenAI.Components.BetaRefusalContent.input())
                     | ExOpenAI.Components.BetaInputImageContent.input())
                    | ExOpenAI.Components.BetaComputerScreenshotContent.input())
                   | ExOpenAI.Components.BetaInputFileContent.input())
                  | ExOpenAI.Components.BetaEncryptedContent.input()
                ),
              required(:id) => String.t(),
              optional(:phase) => :"Elixir.ExOpenAI.Components.BetaMessagePhase-2".input() | nil,
              required(:role) => ExOpenAI.Components.BetaMessageRole.input(),
              required(:status) => ExOpenAI.Components.BetaMessageStatus.input(),
              required(:type) => :message | String.t()
            }
  defstruct [:agent, :content, :id, :phase, :role, :status, :type]
end
