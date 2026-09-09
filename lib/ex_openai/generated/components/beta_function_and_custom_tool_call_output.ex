defmodule ExOpenAI.Components.BetaFunctionAndCustomToolCallOutput do
  @moduledoc """
  Module for representing the OpenAI schema BetaFunctionAndCustomToolCallOutput.

  ## Type

  `ExOpenAI.Components.BetaInputTextContent.t() | ExOpenAI.Components.BetaInputImageContent.t() | ExOpenAI.Components.BetaInputFileContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.BetaInputTextContent.t()
           | ExOpenAI.Components.BetaInputImageContent.t())
          | ExOpenAI.Components.BetaInputFileContent.t()
  @type input() ::
          (ExOpenAI.Components.BetaInputTextContent.input()
           | ExOpenAI.Components.BetaInputImageContent.input())
          | ExOpenAI.Components.BetaInputFileContent.input()
end
