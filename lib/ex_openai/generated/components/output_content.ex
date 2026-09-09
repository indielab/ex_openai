defmodule ExOpenAI.Components.OutputContent do
  @moduledoc """
  Module for representing the OpenAI schema OutputContent.

  ## Type

  `ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t() | ExOpenAI.Components.ReasoningTextContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t())
          | ExOpenAI.Components.ReasoningTextContent.t()
  @type input() ::
          (ExOpenAI.Components.OutputTextContent.input()
           | ExOpenAI.Components.RefusalContent.input())
          | ExOpenAI.Components.ReasoningTextContent.input()
end
