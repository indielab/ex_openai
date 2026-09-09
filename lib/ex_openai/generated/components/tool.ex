defmodule ExOpenAI.Components.Tool do
  @moduledoc """
  A tool that can be used to generate a response.


  ## Type

  `ExOpenAI.Components.FunctionTool.t() | ExOpenAI.Components.FileSearchTool.t() | ExOpenAI.Components.ComputerTool.t() | ExOpenAI.Components.ComputerUsePreviewTool.t() | ExOpenAI.Components.WebSearchTool.t() | ExOpenAI.Components.MCPTool.t() | ExOpenAI.Components.CodeInterpreterTool.t() | ExOpenAI.Components.ProgrammaticToolCallingParam.t() | ExOpenAI.Components.ImageGenTool.t() | ExOpenAI.Components.LocalShellToolParam.t() | ExOpenAI.Components.FunctionShellToolParam.t() | ExOpenAI.Components.CustomToolParam.t() | ExOpenAI.Components.NamespaceToolParam.t() | ExOpenAI.Components.ToolSearchToolParam.t() | ExOpenAI.Components.WebSearchPreviewTool.t() | ExOpenAI.Components.ApplyPatchToolParam.t()`
  """
  @type t() ::
          ((((((((((((((ExOpenAI.Components.FunctionTool.t()
                        | ExOpenAI.Components.FileSearchTool.t())
                       | ExOpenAI.Components.ComputerTool.t())
                      | ExOpenAI.Components.ComputerUsePreviewTool.t())
                     | ExOpenAI.Components.WebSearchTool.t())
                    | ExOpenAI.Components.MCPTool.t())
                   | ExOpenAI.Components.CodeInterpreterTool.t())
                  | ExOpenAI.Components.ProgrammaticToolCallingParam.t())
                 | ExOpenAI.Components.ImageGenTool.t())
                | ExOpenAI.Components.LocalShellToolParam.t())
               | ExOpenAI.Components.FunctionShellToolParam.t())
              | ExOpenAI.Components.CustomToolParam.t())
             | ExOpenAI.Components.NamespaceToolParam.t())
            | ExOpenAI.Components.ToolSearchToolParam.t())
           | ExOpenAI.Components.WebSearchPreviewTool.t())
          | ExOpenAI.Components.ApplyPatchToolParam.t()
  @type input() ::
          ((((((((((((((ExOpenAI.Components.FunctionTool.input()
                        | ExOpenAI.Components.FileSearchTool.input())
                       | ExOpenAI.Components.ComputerTool.input())
                      | ExOpenAI.Components.ComputerUsePreviewTool.input())
                     | ExOpenAI.Components.WebSearchTool.input())
                    | ExOpenAI.Components.MCPTool.input())
                   | ExOpenAI.Components.CodeInterpreterTool.input())
                  | ExOpenAI.Components.ProgrammaticToolCallingParam.input())
                 | ExOpenAI.Components.ImageGenTool.input())
                | ExOpenAI.Components.LocalShellToolParam.input())
               | ExOpenAI.Components.FunctionShellToolParam.input())
              | ExOpenAI.Components.CustomToolParam.input())
             | ExOpenAI.Components.NamespaceToolParam.input())
            | ExOpenAI.Components.ToolSearchToolParam.input())
           | ExOpenAI.Components.WebSearchPreviewTool.input())
          | ExOpenAI.Components.ApplyPatchToolParam.input()
end
