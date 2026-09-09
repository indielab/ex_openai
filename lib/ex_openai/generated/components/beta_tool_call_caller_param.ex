defmodule ExOpenAI.Components.BetaToolCallCallerParam do
  @moduledoc """
  The execution context that produced this tool call.

  ## Type

  `ExOpenAI.Components.BetaDirectToolCallCallerParam.t() | ExOpenAI.Components.BetaProgramToolCallCallerParam.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaDirectToolCallCallerParam.t()
          | ExOpenAI.Components.BetaProgramToolCallCallerParam.t()
  @type input() ::
          ExOpenAI.Components.BetaDirectToolCallCallerParam.input()
          | ExOpenAI.Components.BetaProgramToolCallCallerParam.input()
end
