defmodule ExOpenAI.Components.InputContent do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema InputContent.

  ## Type

  `ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t() | ExOpenAI.Components.InputFileContent.t()`
  """
  @type t() ::
          (ExOpenAI.Components.InputTextContent.t() | ExOpenAI.Components.InputImageContent.t())
          | ExOpenAI.Components.InputFileContent.t()
end
