defmodule ExOpenAI.Components.BetaToolCallCaller do
  @moduledoc """
  The execution context that produced this tool call.

  ## Type

  `ExOpenAI.Components.BetaDirectToolCallCaller.t() | ExOpenAI.Components.BetaProgramToolCallCaller.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaDirectToolCallCaller.t()
          | ExOpenAI.Components.BetaProgramToolCallCaller.t()
  @type input() ::
          ExOpenAI.Components.BetaDirectToolCallCaller.input()
          | ExOpenAI.Components.BetaProgramToolCallCaller.input()
end
