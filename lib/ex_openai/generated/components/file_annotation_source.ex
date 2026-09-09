defmodule ExOpenAI.Components.FileAnnotationSource do
  use ExOpenAI.Jason

  @moduledoc """
  Attachment source referenced by an annotation.

  ## Fields

  * `:filename` - **required** - `String.t()`
    Filename referenced by the annotation.

  * `:type` - **required** - `:file`
    Type discriminator that is always `file`.
    Allowed values: `"file"`
    Default: `"file"`
  """
  @type t() :: %{__struct__: __MODULE__, filename: String.t(), type: :file}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t() | %{required(:filename) => String.t(), required(:type) => :file | String.t()}
  defstruct [:filename, :type]
end
