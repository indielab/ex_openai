defmodule ExOpenAI.Components.BetaOutputMessageContent do
  @moduledoc """
  Module for representing the OpenAI schema BetaOutputMessageContent.

  ## Type

  `ExOpenAI.Components.BetaOutputTextContent.t() | ExOpenAI.Components.BetaRefusalContent.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaOutputTextContent.t()
          | ExOpenAI.Components.BetaRefusalContent.t()
  @type input() ::
          ExOpenAI.Components.BetaOutputTextContent.input()
          | ExOpenAI.Components.BetaRefusalContent.input()
end
