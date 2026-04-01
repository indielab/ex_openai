defmodule ExOpenAI.Components.ItemResource do
  use ExOpenAI.Jason

  @moduledoc """
  Content item used to generate a response.


  ## Type

  `ExOpenAI.Components.InputMessageResource.t() | ExOpenAI.Components.OutputMessage.t() | ExOpenAI.Components.FileSearchToolCall.t() | ExOpenAI.Components.ComputerToolCall.t() | ExOpenAI.Components.ComputerToolCallOutputResource.t() | ExOpenAI.Components.WebSearchToolCall.t() | ExOpenAI.Components.FunctionToolCallResource.t() | ExOpenAI.Components.FunctionToolCallOutputResource.t() | ExOpenAI.Components.ToolSearchCall.t() | ExOpenAI.Components.ToolSearchOutput.t() | ExOpenAI.Components.ReasoningItem.t() | ExOpenAI.Components.CompactionBody.t() | ExOpenAI.Components.ImageGenToolCall.t() | ExOpenAI.Components.CodeInterpreterToolCall.t() | ExOpenAI.Components.LocalShellToolCall.t() | ExOpenAI.Components.LocalShellToolCallOutput.t() | ExOpenAI.Components.FunctionShellCall.t() | ExOpenAI.Components.FunctionShellCallOutput.t() | ExOpenAI.Components.ApplyPatchToolCall.t() | ExOpenAI.Components.ApplyPatchToolCallOutput.t() | ExOpenAI.Components.MCPListTools.t() | ExOpenAI.Components.MCPApprovalRequest.t() | ExOpenAI.Components.MCPApprovalResponseResource.t() | ExOpenAI.Components.MCPToolCall.t() | ExOpenAI.Components.CustomToolCallResource.t() | ExOpenAI.Components.CustomToolCallOutputResource.t()`
  """
  @type t() ::
          ((((((((((((((((((((((((ExOpenAI.Components.InputMessageResource.t()
                                  | ExOpenAI.Components.OutputMessage.t())
                                 | ExOpenAI.Components.FileSearchToolCall.t())
                                | ExOpenAI.Components.ComputerToolCall.t())
                               | ExOpenAI.Components.ComputerToolCallOutputResource.t())
                              | ExOpenAI.Components.WebSearchToolCall.t())
                             | ExOpenAI.Components.FunctionToolCallResource.t())
                            | ExOpenAI.Components.FunctionToolCallOutputResource.t())
                           | ExOpenAI.Components.ToolSearchCall.t())
                          | ExOpenAI.Components.ToolSearchOutput.t())
                         | ExOpenAI.Components.ReasoningItem.t())
                        | ExOpenAI.Components.CompactionBody.t())
                       | ExOpenAI.Components.ImageGenToolCall.t())
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
           | ExOpenAI.Components.CustomToolCallResource.t())
          | ExOpenAI.Components.CustomToolCallOutputResource.t()
end
