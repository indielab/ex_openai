defmodule ExOpenAI.Components.BetaAgentMessage do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema BetaAgentMessage.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.BetaAgentTag.t()`
    The agent that produced this item.

  * `:author` - **required** - `String.t()`
    The sending agent identity.

  * `:content` - **required** - `list( ExOpenAI.Components.BetaInputTextContent.t() | ExOpenAI.Components.BetaOutputTextContent.t() | ExOpenAI.Components.BetaTextContent.t() | ExOpenAI.Components.BetaSummaryTextContent.t() | ExOpenAI.Components.BetaReasoningTextContent.t() | ExOpenAI.Components.BetaRefusalContent.t() | ExOpenAI.Components.BetaInputImageContent.t() | ExOpenAI.Components.BetaComputerScreenshotContent.t() | ExOpenAI.Components.BetaInputFileContent.t() | ExOpenAI.Components.BetaEncryptedContent.t() )`
    Encrypted content sent between agents.

  * `:id` - **required** - `String.t()`
    The unique ID of the agent message.

  * `:recipient` - **required** - `String.t()`
    The destination agent identity.

  * `:type` - **required** - `:agent_message`
    The type of the item. Always `agent_message`.
    Allowed values: `"agent_message"`
    Default: `"agent_message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: ExOpenAI.Components.BetaAgentTag.t() | nil,
          author: String.t(),
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
          recipient: String.t(),
          type: :agent_message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.BetaAgentTag.input(),
              required(:author) => String.t(),
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
              required(:recipient) => String.t(),
              required(:type) => :agent_message | String.t()
            }
  defstruct [:agent, :author, :content, :id, :recipient, :type]
end
