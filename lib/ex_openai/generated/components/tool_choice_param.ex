defmodule ExOpenAI.Components.ToolChoiceParam do
  use ExOpenAI.Jason

  @moduledoc """
  How the model should select which tool (or tools) to use when generating
  a response. See the `tools` parameter to see how to specify which tools
  the model can call.


  ## Type

  `ExOpenAI.Components.ToolChoiceOptions.t() | ExOpenAI.Components.ToolChoiceAllowed.t() | ExOpenAI.Components.ToolChoiceTypes.t() | ExOpenAI.Components.ToolChoiceFunction.t() | ExOpenAI.Components.ToolChoiceMCP.t() | ExOpenAI.Components.ToolChoiceCustom.t() | ExOpenAI.Components.SpecificApplyPatchParam.t() | ExOpenAI.Components.SpecificFunctionShellParam.t()`
  """
  @type t() ::
          ((((((ExOpenAI.Components.ToolChoiceOptions.t()
                | ExOpenAI.Components.ToolChoiceAllowed.t())
               | ExOpenAI.Components.ToolChoiceTypes.t())
              | ExOpenAI.Components.ToolChoiceFunction.t())
             | ExOpenAI.Components.ToolChoiceMCP.t())
            | ExOpenAI.Components.ToolChoiceCustom.t())
           | ExOpenAI.Components.SpecificApplyPatchParam.t())
          | ExOpenAI.Components.SpecificFunctionShellParam.t()
end
