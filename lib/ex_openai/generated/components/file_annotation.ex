defmodule ExOpenAI.Components.FileAnnotation do
  use ExOpenAI.Jason

  @moduledoc """
  Annotation that references an uploaded file.

  ## Fields

  * `:source` - **required** - `ExOpenAI.Components.FileAnnotationSource.t()`
    File attachment referenced by the annotation.

  * `:type` - **required** - `:file`
    Type discriminator that is always `file` for this annotation.
    Allowed values: `"file"`
    Default: `"file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          source: ExOpenAI.Components.FileAnnotationSource.t(),
          type: :file
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:source) => ExOpenAI.Components.FileAnnotationSource.input(),
              required(:type) => :file | String.t()
            }
  defstruct [:source, :type]
end
