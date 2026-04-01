defmodule ExOpenAI.Components.OutputContent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OutputContent.

  ## Type

  `ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t() | ExOpenAI.Components.ReasoningTextContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t())
          | ExOpenAI.Components.ReasoningTextContent.t()
end
