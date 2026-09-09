defmodule ExOpenAI.Components.BetaItem do
  @moduledoc """
  Content item used to generate a response.

  """
  @type t() :: map()
  @type input() ::
          ((((((((((((((((((((((((((((ExOpenAI.Components.BetaInputMessage.input()
                                      | ExOpenAI.Components.BetaOutputMessage.input())
                                     | ExOpenAI.Components.BetaFileSearchToolCall.input())
                                    | ExOpenAI.Components.BetaComputerToolCall.input())
                                   | ExOpenAI.Components.BetaComputerCallOutputItemParam.input())
                                  | ExOpenAI.Components.BetaWebSearchToolCall.input())
                                 | ExOpenAI.Components.BetaFunctionToolCall.input())
                                | ExOpenAI.Components.BetaFunctionCallOutputItemParam.input())
                               | ExOpenAI.Components.BetaAgentMessageItemParam.input())
                              | ExOpenAI.Components.BetaMultiAgentCallItemParam.input())
                             | ExOpenAI.Components.BetaMultiAgentCallOutputItemParam.input())
                            | ExOpenAI.Components.BetaToolSearchCallItemParam.input())
                           | ExOpenAI.Components.BetaToolSearchOutputItemParam.input())
                          | ExOpenAI.Components.BetaAdditionalToolsItemParam.input())
                         | ExOpenAI.Components.BetaReasoningItem.input())
                        | ExOpenAI.Components.BetaCompactionSummaryItemParam.input())
                       | ExOpenAI.Components.BetaImageGenToolCall.input())
                      | ExOpenAI.Components.BetaCodeInterpreterToolCall.input())
                     | ExOpenAI.Components.BetaLocalShellToolCall.input())
                    | ExOpenAI.Components.BetaLocalShellToolCallOutput.input())
                   | ExOpenAI.Components.BetaFunctionShellCallItemParam.input())
                  | ExOpenAI.Components.BetaFunctionShellCallOutputItemParam.input())
                 | ExOpenAI.Components.BetaApplyPatchToolCallItemParam.input())
                | ExOpenAI.Components.BetaApplyPatchToolCallOutputItemParam.input())
               | ExOpenAI.Components.BetaMCPListTools.input())
              | ExOpenAI.Components.BetaMCPApprovalRequest.input())
             | ExOpenAI.Components.BetaMCPApprovalResponse.input())
            | ExOpenAI.Components.BetaMCPToolCall.input())
           | ExOpenAI.Components.BetaCustomToolCallOutput.input())
          | ExOpenAI.Components.BetaCustomToolCall.input()
end
