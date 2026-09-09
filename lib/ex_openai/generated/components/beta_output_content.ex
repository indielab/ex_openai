defmodule ExOpenAI.Components.BetaOutputContent do
  @moduledoc """
  Module for representing the OpenAI schema BetaOutputContent.

  ## Type

  `ExOpenAI.Components.BetaOutputTextContent.t() | ExOpenAI.Components.BetaRefusalContent.t() | ExOpenAI.Components.BetaReasoningTextContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.BetaOutputTextContent.t()
           | ExOpenAI.Components.BetaRefusalContent.t())
          | ExOpenAI.Components.BetaReasoningTextContent.t()
  @type input() ::
          (ExOpenAI.Components.BetaOutputTextContent.input()
           | ExOpenAI.Components.BetaRefusalContent.input())
          | ExOpenAI.Components.BetaReasoningTextContent.input()
end
