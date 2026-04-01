defmodule ExOpenAI.Components.RealtimeConversationItem do
  use ExOpenAI.Jason

  @moduledoc """
  A single item within a Realtime conversation.

  ## Type

  `ExOpenAI.Components.RealtimeConversationItemMessageSystem.t() | ExOpenAI.Components.RealtimeConversationItemMessageUser.t() | ExOpenAI.Components.RealtimeConversationItemMessageAssistant.t() | ExOpenAI.Components.RealtimeConversationItemFunctionCall.t() | ExOpenAI.Components.RealtimeConversationItemFunctionCallOutput.t() | ExOpenAI.Components.RealtimeMCPApprovalResponse.t() | ExOpenAI.Components.RealtimeMCPListTools.t() | ExOpenAI.Components.RealtimeMCPToolCall.t() | ExOpenAI.Components.RealtimeMCPApprovalRequest.t()`
  """
  @type t() ::
          (((((((ExOpenAI.Components.RealtimeConversationItemMessageSystem.t()
                 | ExOpenAI.Components.RealtimeConversationItemMessageUser.t())
                | ExOpenAI.Components.RealtimeConversationItemMessageAssistant.t())
               | ExOpenAI.Components.RealtimeConversationItemFunctionCall.t())
              | ExOpenAI.Components.RealtimeConversationItemFunctionCallOutput.t())
             | ExOpenAI.Components.RealtimeMCPApprovalResponse.t())
            | ExOpenAI.Components.RealtimeMCPListTools.t())
           | ExOpenAI.Components.RealtimeMCPToolCall.t())
          | ExOpenAI.Components.RealtimeMCPApprovalRequest.t()
end
