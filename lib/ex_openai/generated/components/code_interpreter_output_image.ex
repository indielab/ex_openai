defmodule ExOpenAI.Components.CodeInterpreterOutputImage do
  use ExOpenAI.Jason

  @moduledoc """
  The image output from the code interpreter.

  ## Fields

  * `:type` - **required** - `:image`
    The type of the output. Always `image`.
    Allowed values: `"image"`
    Default: `"image"`

  * `:url` - **required** - `String.t()`
    The URL of the image output from the code interpreter.
    Format: `uri`
  """
  @type t() :: %{__struct__: __MODULE__, type: :image, url: String.t()}
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() :: t() | %{required(:type) => :image | String.t(), required(:url) => String.t()}
  defstruct [:type, :url]
end
