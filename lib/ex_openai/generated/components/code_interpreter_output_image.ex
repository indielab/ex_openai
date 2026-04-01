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
  """
  @type t() :: %{__struct__: __MODULE__, type: :image, url: String.t()}
  defstruct [:type, :url]
end
