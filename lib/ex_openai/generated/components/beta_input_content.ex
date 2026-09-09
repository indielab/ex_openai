defmodule ExOpenAI.Components.BetaInputContent do
  @moduledoc """
  Module for representing the OpenAI schema BetaInputContent.

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
