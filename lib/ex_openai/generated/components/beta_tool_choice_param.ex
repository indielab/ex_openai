defmodule ExOpenAI.Components.BetaToolChoiceParam do
  @moduledoc """
  How the model should select which tool (or tools) to use when generating
  a response. See the `tools` parameter to see how to specify which tools
  the model can call.


  ## Type

  `ExOpenAI.Components.BetaToolChoiceOptions.t() | ExOpenAI.Components.BetaToolChoiceAllowed.t() | ExOpenAI.Components.BetaToolChoiceTypes.t() | ExOpenAI.Components.BetaToolChoiceFunction.t() | ExOpenAI.Components.BetaToolChoiceMCP.t() | ExOpenAI.Components.BetaToolChoiceCustom.t() | ExOpenAI.Components.BetaSpecificProgrammaticToolCallingParam.t() | ExOpenAI.Components.BetaSpecificApplyPatchParam.t() | ExOpenAI.Components.BetaSpecificFunctionShellParam.t()`
  """
  @type t() ::
          (((((((ExOpenAI.Components.BetaToolChoiceOptions.t()
                 | ExOpenAI.Components.BetaToolChoiceAllowed.t())
                | ExOpenAI.Components.BetaToolChoiceTypes.t())
               | ExOpenAI.Components.BetaToolChoiceFunction.t())
              | ExOpenAI.Components.BetaToolChoiceMCP.t())
             | ExOpenAI.Components.BetaToolChoiceCustom.t())
            | ExOpenAI.Components.BetaSpecificProgrammaticToolCallingParam.t())
           | ExOpenAI.Components.BetaSpecificApplyPatchParam.t())
          | ExOpenAI.Components.BetaSpecificFunctionShellParam.t()
  @type input() ::
          (((((((ExOpenAI.Components.BetaToolChoiceOptions.input()
                 | ExOpenAI.Components.BetaToolChoiceAllowed.input())
                | ExOpenAI.Components.BetaToolChoiceTypes.input())
               | ExOpenAI.Components.BetaToolChoiceFunction.input())
              | ExOpenAI.Components.BetaToolChoiceMCP.input())
             | ExOpenAI.Components.BetaToolChoiceCustom.input())
            | ExOpenAI.Components.BetaSpecificProgrammaticToolCallingParam.input())
           | ExOpenAI.Components.BetaSpecificApplyPatchParam.input())
          | ExOpenAI.Components.BetaSpecificFunctionShellParam.input()
end
