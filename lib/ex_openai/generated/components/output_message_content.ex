defmodule ExOpenAI.Components.OutputMessageContent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema OutputMessageContent.

  ## Type

  `ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t()`
  """
  @type t() :: ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t()
end
