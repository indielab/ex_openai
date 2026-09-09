defmodule ExOpenAI.Components.Annotation do
  @moduledoc """
  An annotation that applies to a span of output text.

  ## Type

  `ExOpenAI.Components.FileCitationBody.t() | ExOpenAI.Components.UrlCitationBody.t() | ExOpenAI.Components.ContainerFileCitationBody.t() | ExOpenAI.Components.FilePath.t()`
  """
  @type t() ::
          ((ExOpenAI.Components.FileCitationBody.t() | ExOpenAI.Components.UrlCitationBody.t())
           | ExOpenAI.Components.ContainerFileCitationBody.t())
          | ExOpenAI.Components.FilePath.t()
  @type input() ::
          ((ExOpenAI.Components.FileCitationBody.input()
            | ExOpenAI.Components.UrlCitationBody.input())
           | ExOpenAI.Components.ContainerFileCitationBody.input())
          | ExOpenAI.Components.FilePath.input()
end
