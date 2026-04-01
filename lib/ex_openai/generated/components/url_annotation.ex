defmodule ExOpenAI.Components.UrlAnnotation do
  use ExOpenAI.Jason

  @moduledoc """
  Annotation that references a URL.

  ## Fields

  * `:source` - **required** - `ExOpenAI.Components.UrlAnnotationSource.t()`  
    URL referenced by the annotation.

  * `:type` - **required** - `:url`  
    Type discriminator that is always `url` for this annotation.  
    Allowed values: `"url"`  
    Default: `"url"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          source: ExOpenAI.Components.UrlAnnotationSource.t(),
          type: :url
        }
  defstruct [:source, :type]
end
