defmodule ExOpenAI.Components.ImagesUsage do
  use ExOpenAI.Jason

  @moduledoc """
  For the GPT image models only, the token usage information for the image generation.


  ## Fields

  * `:input_tokens` - **required** - `integer()`  
    The number of tokens (images and text) in the input prompt.

  * `:input_tokens_details` - **required** - `{:%{}, [], [{{:required, [], [:image_tokens]}, {:integer, [], []}}, {{:required, [], [:text_tokens]}, {:integer, [], []}}]}`  
    The input tokens detailed information for the image generation.

  * `:output_tokens` - **required** - `integer()`  
    The number of image tokens in the output image.

  * `:total_tokens` - **required** - `integer()`  
    The total number of tokens (images and text) used for the image generation.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          input_tokens: integer(),
          input_tokens_details: %{
            required(:image_tokens) => integer(),
            required(:text_tokens) => integer()
          },
          output_tokens: integer(),
          total_tokens: integer()
        }
  defstruct [:input_tokens, :input_tokens_details, :output_tokens, :total_tokens]
end
