defmodule ExOpenAI.Components.OutputMessageContent do
  @moduledoc """
  Module for representing the OpenAI schema OutputMessageContent.

  ## Type

  `ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t()`
  """
  @type t() :: ExOpenAI.Components.OutputTextContent.t() | ExOpenAI.Components.RefusalContent.t()
  @type input() ::
          ExOpenAI.Components.OutputTextContent.input()
          | ExOpenAI.Components.RefusalContent.input()
end
