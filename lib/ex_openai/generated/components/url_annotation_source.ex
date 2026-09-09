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
    Format: `uri`
  """
  @type t() :: %{__struct__: __MODULE__, type: :url, url: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :url | String.t(), required(:url) => String.t()}
  defstruct [:type, :url]
end
