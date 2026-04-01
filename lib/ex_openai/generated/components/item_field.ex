defmodule ExOpenAI.Components.ItemField do
  use ExOpenAI.Jason

  @moduledoc """
  An item representing a message, tool call, tool output, reasoning, or other response element.

  ## Type

  `ExOpenAI.Components.Message.t() | ExOpenAI.Components.FunctionToolCall.t() | ExOpenAI.Components.ToolSearchCall.t() | ExOpenAI.Components.ToolSearchOutput.t() | ExOpenAI.Components.FunctionToolCallOutput.t() | ExOpenAI.Components.FileSearchToolCall.t() | ExOpenAI.Components.WebSearchToolCall.t() | ExOpenAI.Components.ImageGenToolCall.t() | ExOpenAI.Components.ComputerToolCall.t() | ExOpenAI.Components.ComputerToolCallOutputResource.t() | ExOpenAI.Components.ReasoningItem.t() | ExOpenAI.Components.CompactionBody.t() | ExOpenAI.Components.CodeInterpreterToolCall.t() | ExOpenAI.Components.LocalShellToolCall.t() | ExOpenAI.Components.LocalShellToolCallOutput.t() | ExOpenAI.Components.FunctionShellCall.t() | ExOpenAI.Components.FunctionShellCallOutput.t() | ExOpenAI.Components.ApplyPatchToolCall.t() | ExOpenAI.Components.ApplyPatchToolCallOutput.t() | ExOpenAI.Components.MCPListTools.t() | ExOpenAI.Components.MCPApprovalRequest.t() | ExOpenAI.Components.MCPApprovalResponseResource.t() | ExOpenAI.Components.MCPToolCall.t() | ExOpenAI.Components.CustomToolCall.t() | ExOpenAI.Components.CustomToolCallOutput.t()`
  """
  @type t() ::
          (((((((((((((((((((((((ExOpenAI.Components.Message.t()
                                 | ExOpenAI.Components.FunctionToolCall.t())
                                | ExOpenAI.Components.ToolSearchCall.t())
                               | ExOpenAI.Components.ToolSearchOutput.t())
                              | ExOpenAI.Components.FunctionToolCallOutput.t())
                             | ExOpenAI.Components.FileSearchToolCall.t())
                            | ExOpenAI.Components.WebSearchToolCall.t())
                           | ExOpenAI.Components.ImageGenToolCall.t())
                          | ExOpenAI.Components.ComputerToolCall.t())
                         | ExOpenAI.Components.ComputerToolCallOutputResource.t())
                        | ExOpenAI.Components.ReasoningItem.t())
                       | ExOpenAI.Components.CompactionBody.t())
                      | ExOpenAI.Components.CodeInterpreterToolCall.t())
                     | ExOpenAI.Components.LocalShellToolCall.t())
                    | ExOpenAI.Components.LocalShellToolCallOutput.t())
                   | ExOpenAI.Components.FunctionShellCall.t())
                  | ExOpenAI.Components.FunctionShellCallOutput.t())
                 | ExOpenAI.Components.ApplyPatchToolCall.t())
                | ExOpenAI.Components.ApplyPatchToolCallOutput.t())
               | ExOpenAI.Components.MCPListTools.t())
              | ExOpenAI.Components.MCPApprovalRequest.t())
             | ExOpenAI.Components.MCPApprovalResponseResource.t())
            | ExOpenAI.Components.MCPToolCall.t())
           | ExOpenAI.Components.CustomToolCall.t())
          | ExOpenAI.Components.CustomToolCallOutput.t()
end
