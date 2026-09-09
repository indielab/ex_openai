defmodule ExOpenAI.Components.Item do
  @moduledoc """
  Content item used to generate a response.

  """
  @type t() :: map()
  @type input() ::
          (((((((((((((((((((((((((ExOpenAI.Components.InputMessage.input()
                                   | ExOpenAI.Components.OutputMessage.input())
                                  | ExOpenAI.Components.FileSearchToolCall.input())
                                 | ExOpenAI.Components.ComputerToolCall.input())
                                | ExOpenAI.Components.ComputerCallOutputItemParam.input())
                               | ExOpenAI.Components.WebSearchToolCall.input())
                              | ExOpenAI.Components.FunctionToolCall.input())
                             | ExOpenAI.Components.FunctionCallOutputItemParam.input())
                            | ExOpenAI.Components.ToolSearchCallItemParam.input())
                           | ExOpenAI.Components.ToolSearchOutputItemParam.input())
                          | ExOpenAI.Components.AdditionalToolsItemParam.input())
                         | ExOpenAI.Components.ReasoningItem.input())
                        | ExOpenAI.Components.CompactionSummaryItemParam.input())
                       | ExOpenAI.Components.ImageGenToolCall.input())
                      | ExOpenAI.Components.CodeInterpreterToolCall.input())
                     | ExOpenAI.Components.LocalShellToolCall.input())
                    | ExOpenAI.Components.LocalShellToolCallOutput.input())
                   | ExOpenAI.Components.FunctionShellCallItemParam.input())
                  | ExOpenAI.Components.FunctionShellCallOutputItemParam.input())
                 | ExOpenAI.Components.ApplyPatchToolCallItemParam.input())
                | ExOpenAI.Components.ApplyPatchToolCallOutputItemParam.input())
               | ExOpenAI.Components.MCPListTools.input())
              | ExOpenAI.Components.MCPApprovalRequest.input())
             | ExOpenAI.Components.MCPApprovalResponse.input())
            | ExOpenAI.Components.MCPToolCall.input())
           | ExOpenAI.Components.CustomToolCallOutput.input())
          | ExOpenAI.Components.CustomToolCall.input()
end
