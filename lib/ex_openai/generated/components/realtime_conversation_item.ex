defmodule ExOpenAI.Components.RealtimeConversationItem do
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
  @type input() ::
          (((((((ExOpenAI.Components.RealtimeConversationItemMessageSystem.input()
                 | ExOpenAI.Components.RealtimeConversationItemMessageUser.input())
                | ExOpenAI.Components.RealtimeConversationItemMessageAssistant.input())
               | ExOpenAI.Components.RealtimeConversationItemFunctionCall.input())
              | ExOpenAI.Components.RealtimeConversationItemFunctionCallOutput.input())
             | ExOpenAI.Components.RealtimeMCPApprovalResponse.input())
            | ExOpenAI.Components.RealtimeMCPListTools.input())
           | ExOpenAI.Components.RealtimeMCPToolCall.input())
          | ExOpenAI.Components.RealtimeMCPApprovalRequest.input()
end
