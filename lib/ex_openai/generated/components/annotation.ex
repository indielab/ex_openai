defmodule ExOpenAI.Components.Annotation do
  use ExOpenAI.Jason

  @moduledoc """
  An annotation that applies to a span of output text.

  ## Type

  `ExOpenAI.Components.FileCitationBody.t() | ExOpenAI.Components.UrlCitationBody.t() | ExOpenAI.Components.ContainerFileCitationBody.t() | ExOpenAI.Components.FilePath.t()`
  """
  @type t() ::
          ((ExOpenAI.Components.FileCitationBody.t() | ExOpenAI.Components.UrlCitationBody.t())
           | ExOpenAI.Components.ContainerFileCitationBody.t())
          | ExOpenAI.Components.FilePath.t()
end
