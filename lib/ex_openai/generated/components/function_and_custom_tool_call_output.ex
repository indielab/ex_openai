defmodule ExOpenAI.Components.FunctionAndCustomToolCallOutput do
  @moduledoc """
  Module for representing the OpenAI schema FunctionAndCustomToolCallOutput.

  ## Type

  `ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t() | ExOpenAI.Components.InputFileContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t())
          | ExOpenAI.Components.InputFileContent.t()
  @type input() ::
          (ExOpenAI.Components.InputTextContent.input()
           | ExOpenAI.Components.InputImageContent.input())
          | ExOpenAI.Components.InputFileContent.input()
end
