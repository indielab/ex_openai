defmodule ExOpenAI.Components.BetaTool do
  @moduledoc """
  A tool that can be used to generate a response.


  ## Type

  `ExOpenAI.Components.BetaFunctionTool.t() | ExOpenAI.Components.BetaFileSearchTool.t() | ExOpenAI.Components.BetaComputerTool.t() | ExOpenAI.Components.BetaComputerUsePreviewTool.t() | ExOpenAI.Components.BetaWebSearchTool.t() | ExOpenAI.Components.BetaMCPTool.t() | ExOpenAI.Components.BetaCodeInterpreterTool.t() | ExOpenAI.Components.BetaProgrammaticToolCallingParam.t() | ExOpenAI.Components.BetaImageGenTool.t() | ExOpenAI.Components.BetaLocalShellToolParam.t() | ExOpenAI.Components.BetaFunctionShellToolParam.t() | ExOpenAI.Components.BetaCustomToolParam.t() | ExOpenAI.Components.BetaNamespaceToolParam.t() | ExOpenAI.Components.BetaToolSearchToolParam.t() | ExOpenAI.Components.BetaWebSearchPreviewTool.t() | ExOpenAI.Components.BetaApplyPatchToolParam.t()`
  """
  @type t() ::
          ((((((((((((((ExOpenAI.Components.BetaFunctionTool.t()
                        | ExOpenAI.Components.BetaFileSearchTool.t())
                       | ExOpenAI.Components.BetaComputerTool.t())
                      | ExOpenAI.Components.BetaComputerUsePreviewTool.t())
                     | ExOpenAI.Components.BetaWebSearchTool.t())
                    | ExOpenAI.Components.BetaMCPTool.t())
                   | ExOpenAI.Components.BetaCodeInterpreterTool.t())
                  | ExOpenAI.Components.BetaProgrammaticToolCallingParam.t())
                 | ExOpenAI.Components.BetaImageGenTool.t())
                | ExOpenAI.Components.BetaLocalShellToolParam.t())
               | ExOpenAI.Components.BetaFunctionShellToolParam.t())
              | ExOpenAI.Components.BetaCustomToolParam.t())
             | ExOpenAI.Components.BetaNamespaceToolParam.t())
            | ExOpenAI.Components.BetaToolSearchToolParam.t())
           | ExOpenAI.Components.BetaWebSearchPreviewTool.t())
          | ExOpenAI.Components.BetaApplyPatchToolParam.t()
  @type input() ::
          ((((((((((((((ExOpenAI.Components.BetaFunctionTool.input()
                        | ExOpenAI.Components.BetaFileSearchTool.input())
                       | ExOpenAI.Components.BetaComputerTool.input())
                      | ExOpenAI.Components.BetaComputerUsePreviewTool.input())
                     | ExOpenAI.Components.BetaWebSearchTool.input())
                    | ExOpenAI.Components.BetaMCPTool.input())
                   | ExOpenAI.Components.BetaCodeInterpreterTool.input())
                  | ExOpenAI.Components.BetaProgrammaticToolCallingParam.input())
                 | ExOpenAI.Components.BetaImageGenTool.input())
                | ExOpenAI.Components.BetaLocalShellToolParam.input())
               | ExOpenAI.Components.BetaFunctionShellToolParam.input())
              | ExOpenAI.Components.BetaCustomToolParam.input())
             | ExOpenAI.Components.BetaNamespaceToolParam.input())
            | ExOpenAI.Components.BetaToolSearchToolParam.input())
           | ExOpenAI.Components.BetaWebSearchPreviewTool.input())
          | ExOpenAI.Components.BetaApplyPatchToolParam.input()
end
