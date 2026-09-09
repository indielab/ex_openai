defmodule ExOpenAI.Components.BetaAgentMessageItemParam do
  use ExOpenAI.Jason

  @moduledoc """
  A message routed between agents.

  ## Fields

  * `:agent` - **optional** - `ExOpenAI.Components.Beta_AgentTagParam.t() | nil`

  * `:author` - **required** - `String.t()`
    The sending agent identity.

  * `:content` - **required** - `list( ExOpenAI.Components.BetaInputTextContentParam.t() | ExOpenAI.Components.BetaInputImageContentParamAutoParam.t() | ExOpenAI.Components.BetaEncryptedContentParam.t() )`
    Plaintext, image, or encrypted content sent between agents.

  * `:id` - **optional** - `String.t() | nil`

  * `:recipient` - **required** - `String.t()`
    The destination agent identity.

  * `:type` - **required** - `:agent_message`
    The item type. Always `agent_message`.
    Allowed values: `"agent_message"`
    Default: `"agent_message"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          agent: (ExOpenAI.Components.Beta_AgentTagParam.t() | nil) | nil,
          author: String.t(),
          content:
            list(
              (ExOpenAI.Components.BetaInputTextContentParam.t()
               | ExOpenAI.Components.BetaInputImageContentParamAutoParam.t())
              | ExOpenAI.Components.BetaEncryptedContentParam.t()
            ),
          id: (String.t() | nil) | nil,
          recipient: String.t(),
          type: :agent_message
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:agent) => ExOpenAI.Components.Beta_AgentTagParam.input() | nil,
              required(:author) => String.t(),
              required(:content) =>
                list(
                  (ExOpenAI.Components.BetaInputTextContentParam.input()
                   | ExOpenAI.Components.BetaInputImageContentParamAutoParam.input())
                  | ExOpenAI.Components.BetaEncryptedContentParam.input()
                ),
              optional(:id) => String.t() | nil,
              required(:recipient) => String.t(),
              required(:type) => :agent_message | String.t()
            }
  defstruct [:agent, :author, :content, :id, :recipient, :type]
end
