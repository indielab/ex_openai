defmodule ExOpenAI.Components.UrlAnnotationSource do
  use ExOpenAI.Jason

  @moduledoc """
  URL backing an annotation entry.

  ## Fields

  * `:type` - **required** - `:url`  
    Type discriminator that is always `url`.  
    Allowed values: `"url"`  
    Default: `"url"`

  * `:url` - **required** - `String.t()`  
    URL referenced by the annotation.
  """
  @type t() :: %{__struct__: __MODULE__, type: :url, url: String.t()}
  defstruct [:type, :url]
end
