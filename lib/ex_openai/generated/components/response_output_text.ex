defmodule ExOpenAI.Components.ResponseOutputText do
  use ExOpenAI.Jason

  @moduledoc """
  Assistant response text accompanied by optional annotations.

  ## Fields

  * `:annotations` - **required** - `list(ExOpenAI.Components.FileAnnotation.t() | ExOpenAI.Components.UrlAnnotation.t())`
    Ordered list of annotations attached to the response text.

  * `:text` - **required** - `String.t()`
    Assistant generated text.

  * `:type` - **required** - `:output_text`
    Type discriminator that is always `output_text`.
    Allowed values: `"output_text"`
    Default: `"output_text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          annotations:
            list(ExOpenAI.Components.FileAnnotation.t() | ExOpenAI.Components.UrlAnnotation.t()),
          text: String.t(),
          type: :output_text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:annotations) =>
                list(
                  ExOpenAI.Components.FileAnnotation.input()
                  | ExOpenAI.Components.UrlAnnotation.input()
                ),
              required(:text) => String.t(),
              required(:type) => :output_text | String.t()
            }
  defstruct [:annotations, :text, :type]
end
