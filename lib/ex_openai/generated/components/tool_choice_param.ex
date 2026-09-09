defmodule ExOpenAI.Components.ToolChoiceParam do
  @moduledoc """
  How the model should select which tool (or tools) to use when generating
  a response. See the `tools` parameter to see how to specify which tools
  the model can call.


  ## Type

  `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceAllowed.t() | ExOpenAI.Components.ToolChoiceTypes.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t() | ExOpenAI.Components.ToolChoiceCustom.t() | ExOpenAI.Components.SpecificProgrammaticToolCallingParam.t() | ExOpenAI.Components.SpecificApplyPatchParam.t() | ExOpenAI.Components.SpecificFunctionShellParam.t()`
  """
  @type t() ::
          (((((((ExOpenAI.Components.ToolChoiceOptions.t()
                 | ExOpenAI.Components.ToolChoiceAllowed.t())
                | ExOpenAI.Components.ToolChoiceTypes.t())
               | ExOpenAI.Components.ToolChoiceFunction.t())
              | ExOpenAI.Components.ToolChoiceMCP.t())
             | ExOpenAI.Components.ToolChoiceCustom.t())
            | ExOpenAI.Components.SpecificProgrammaticToolCallingParam.t())
           | ExOpenAI.Components.SpecificApplyPatchParam.t())
          | ExOpenAI.Components.SpecificFunctionShellParam.t()
  @type input() ::
          (((((((ExOpenAI.Components.ToolChoiceOptions.input()
                 | ExOpenAI.Components.ToolChoiceAllowed.input())
                | ExOpenAI.Components.ToolChoiceTypes.input())
               | ExOpenAI.Components.ToolChoiceFunction.input())
              | ExOpenAI.Components.ToolChoiceMCP.input())
             | ExOpenAI.Components.ToolChoiceCustom.input())
            | ExOpenAI.Components.SpecificProgrammaticToolCallingParam.input())
           | ExOpenAI.Components.SpecificApplyPatchParam.input())
          | ExOpenAI.Components.SpecificFunctionShellParam.input()
end
