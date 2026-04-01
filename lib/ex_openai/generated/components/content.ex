defmodule ExOpenAI.Components.Content do
  use ExOpenAI.Jason

  @moduledoc """
  Multi-modal input and output contents.


  ## Type

  `ExOpenAI.Components.InputContent.t() | ExOpenAI.Components.OutputContent.t()`
  """
  @type t() :: ExOpenAI.Components.InputContent.t() | ExOpenAI.Components.OutputContent.t()
end
