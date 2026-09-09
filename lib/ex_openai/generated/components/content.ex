defmodule ExOpenAI.Components.Content do
  @moduledoc """
  Multi-modal input and output contents.


  ## Type

  `ExOpenAI.Components.InputContent.t() | ExOpenAI.Components.OutputContent.t()`
  """
  @type t() :: ExOpenAI.Components.InputContent.t() | ExOpenAI.Components.OutputContent.t()
  @type input() ::
          ExOpenAI.Components.InputContent.input() | ExOpenAI.Components.OutputContent.input()
end
