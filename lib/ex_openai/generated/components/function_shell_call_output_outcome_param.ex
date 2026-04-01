defmodule ExOpenAI.Components.FunctionShellCallOutputOutcomeParam do
  use ExOpenAI.Jason

  @moduledoc """
  The exit or timeout outcome associated with this shell call.

  ## Type

  `ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcomeParam.t() | ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam.t()`
  """
  @type t() ::
          ExOpenAI.Components.FunctionShellCallOutputTimeoutOutcomeParam.t()
          | ExOpenAI.Components.FunctionShellCallOutputExitOutcomeParam.t()
end
