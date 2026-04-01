defmodule ExOpenAI.Components.FunctionAndCustomToolCallOutput do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema FunctionAndCustomToolCallOutput.

  ## Type

  `ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t() | ExOpenAI.Components.InputFileContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t())
          | ExOpenAI.Components.InputFileContent.t()
end
