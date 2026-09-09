defmodule ExOpenAI.Components.BetaContent do
  @moduledoc """
  Multi-modal input and output contents.


  ## Type

  `ExOpenAI.Components.BetaInputContent.t() | ExOpenAI.Components.BetaOutputContent.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaInputContent.t() | ExOpenAI.Components.BetaOutputContent.t()
  @type input() ::
          ExOpenAI.Components.BetaInputContent.input()
          | ExOpenAI.Components.BetaOutputContent.input()
end
