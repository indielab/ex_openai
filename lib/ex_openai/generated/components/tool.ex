defmodule ExOpenAI.Components.Tool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that can be used to generate a response.


  ## Type

  `ExOpenAI.Components.FunctionTool.t() | ExOpenAI.Components.FileSearchTool.t() | ExOpenAI.Components.ComputerTool.t() | ExOpenAI.Components.ComputerUsePreviewTool.t() | ExOpenAI.Components.WebSearchTool.t() | ExOpenAI.Components.MCPTool.t() | ExOpenAI.Components.CodeInterpreterTool.t() | ExOpenAI.Components.ImageGenTool.t() | ExOpenAI.Components.LocalShellToolParam.t() | ExOpenAI.Components.FunctionShellToolParam.t() | ExOpenAI.Components.CustomToolParam.t() | ExOpenAI.Components.NamespaceToolParam.t() | ExOpenAI.Components.ToolSearchToolParam.t() | ExOpenAI.Components.WebSearchPreviewTool.t() | ExOpenAI.Components.ApplyPatchToolParam.t()`
  """
  @type t() ::
          (((((((((((((ExOpenAI.Components.FunctionTool.t()
                       | ExOpenAI.Components.FileSearchTool.t())
                      | ExOpenAI.Components.ComputerTool.t())
                     | ExOpenAI.Components.ComputerUsePreviewTool.t())
                    | ExOpenAI.Components.WebSearchTool.t())
                   | ExOpenAI.Components.MCPTool.t())
                  | ExOpenAI.Components.CodeInterpreterTool.t())
                 | ExOpenAI.Components.ImageGenTool.t())
                | ExOpenAI.Components.LocalShellToolParam.t())
               | ExOpenAI.Components.FunctionShellToolParam.t())
              | ExOpenAI.Components.CustomToolParam.t())
             | ExOpenAI.Components.NamespaceToolParam.t())
            | ExOpenAI.Components.ToolSearchToolParam.t())
           | ExOpenAI.Components.WebSearchPreviewTool.t())
          | ExOpenAI.Components.ApplyPatchToolParam.t()
end
