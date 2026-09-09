defmodule ExOpenAI.Components.FunctionShellCallOutputOutcomeParam do
  @moduledoc """
  The exit or timeout outcome associated with this shell call.

  ## Type

  `ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcomeParam.t() | ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam.t()`
  """
  @type t() ::
          ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcomeParam.t()
          | ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam.t()
  @type input() ::
          ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcomeParam.input()
          | ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam.input()
end
