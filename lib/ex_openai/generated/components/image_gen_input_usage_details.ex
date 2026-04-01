defmodule ExOpenAI.Components.ImageGenInputUsageDetails do
  use ExOpenAI.Jason

  @moduledoc """
  The input tokens detailed information for the image generation.

  ## Fields

  * `:image_tokens` - **required** - `integer()`  
    The number of image tokens in the input prompt.

  * `:text_tokens` - **required** - `integer()`  
    The number of text tokens in the input prompt.
  """
  @type t() :: %{__struct__: __MODULE__, image_tokens: integer(), text_tokens: integer()}
  defstruct [:image_tokens, :text_tokens]
end
