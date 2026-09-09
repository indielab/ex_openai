defmodule ExOpenAI.Components.BetaFunctionShellCallOutputOutcomeParam do
  @moduledoc """
  The exit or timeout outcome associated with this shell call.

  ## Type

  `ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcomeParam.t() | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcomeParam.t()`
  """
  @type t() ::
          ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcomeParam.t()
          | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcomeParam.t()
  @type input() ::
          ExOpenAI.Components.BetaFunctionShellCallOutputTimeoutOutcomeParam.input()
          | ExOpenAI.Components.BetaFunctionShellCallOutputExitOutcomeParam.input()
end
