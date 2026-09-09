defmodule ExOpenAI.Components.BetaAnnotation do
  @moduledoc """
  An annotation that applies to a span of output text.

  ## Type

  `ExOpenAI.Components.BetaFileCitationBody.t() | ExOpenAI.Components.BetaUrlCitationBody.t() | ExOpenAI.Components.BetaContainerFileCitationBody.t() | ExOpenAI.Components.BetaFilePath.t()`
  """
  @type t() ::
          ((ExOpenAI.Components.BetaFileCitationBody.t()
            | ExOpenAI.Components.BetaUrlCitationBody.t())
           | ExOpenAI.Components.BetaContainerFileCitationBody.t())
          | ExOpenAI.Components.BetaFilePath.t()
  @type input() ::
          ((ExOpenAI.Components.BetaFileCitationBody.input()
            | ExOpenAI.Components.BetaUrlCitationBody.input())
           | ExOpenAI.Components.BetaContainerFileCitationBody.input())
          | ExOpenAI.Components.BetaFilePath.input()
end
