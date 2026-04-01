defmodule ExOpenAI.Components.EditImageBodyJsonParam do
  use ExOpenAI.Jason

  @moduledoc """
  JSON request body for image edits.

  Use `images` (array of `ImageRefParam`) instead of multipart `image` uploads.
  You can reference images via external URLs, data URLs, or uploaded file IDs.
  JSON edits support GPT image models only; DALL-E edits require multipart (`dall-e-2` only).


  ## Fields

  * `:background` - **optional** - `:transparent | :opaque | :auto | any()`  
    Background behavior for generated image output.  
    Default: `"auto"`

  * `:images` - **required** - `[ExOpenAI.Components.ImageRefParam.t()]`  
    Input image references to edit.
  For GPT image models, you can provide up to 16 images.  
    Constraints: minItems: 1, maxItems: 16

  * `:input_fidelity` - **optional** - `:high | :low | any()`  
    Controls fidelity to the original input image(s).

  * `:mask` - **optional** - `ExOpenAI.Components.ImageRefParam.t()`

  * `:model` - **optional** - `String.t() | :"gpt-image-1.5" | :"gpt-image-1" | :"gpt-image-1-mini" | :"chatgpt-image-latest" | any()`  
    The model to use for image editing.  
    Default: `"gpt-image-1.5"`

  * `:moderation` - **optional** - `:low | :auto | any()`  
    Moderation level for GPT image models.  
    Default: `"auto"`

  * `:n` - **optional** - `integer() | any()`  
    The number of edited images to generate.  
    Default: `1`

  * `:output_compression` - **optional** - `integer() | any()`  
    Compression level for `jpeg` or `webp` output.

  * `:output_format` - **optional** - `:png | :jpeg | :webp | any()`  
    Output image format. Supported for GPT image models.  
    Default: `"png"`

  * `:partial_images` - **optional** - `ExOpenAI.Components.PartialImages.t()`

  * `:prompt` - **required** - `String.t()`  
    A text description of the desired image edit.  
    Constraints: minLength: 1, maxLength: 32000

  * `:quality` - **optional** - `:low | :medium | :high | :auto | any()`  
    Output quality for GPT image models.  
    Default: `"auto"`

  * `:size` - **optional** - `:auto | :"1024x1024" | :"1536x1024" | :"1024x1536" | any()`  
    Requested output image size.  
    Default: `"auto"`

  * `:stream` - **optional** - `boolean() | any()`  
    Stream partial image results as events.  
    Default: `false`

  * `:user` - **optional** - `String.t()`  
    A unique identifier representing your end-user, which can help OpenAI
  monitor and detect abuse.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (((:transparent | :opaque) | :auto) | any()) | nil,
          images: list(ExOpenAI.Components.ImageRefParam.t()),
          input_fidelity: ((:high | :low) | any()) | nil,
          mask: ExOpenAI.Components.ImageRefParam.t() | nil,
          model:
            ((String.t()
              | ((:"gpt-image-1.5" | :"gpt-image-1") | :"gpt-image-1-mini")
              | :"chatgpt-image-latest")
             | any())
            | nil,
          moderation: ((:low | :auto) | any()) | nil,
          n: (integer() | any()) | nil,
          output_compression: (integer() | any()) | nil,
          output_format: (((:png | :jpeg) | :webp) | any()) | nil,
          partial_images: ExOpenAI.Components.PartialImages.t() | nil,
          prompt: String.t(),
          quality: ((((:low | :medium) | :high) | :auto) | any()) | nil,
          size: ((((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | any()) | nil,
          stream: (boolean() | any()) | nil,
          user: String.t() | nil
        }
  defstruct [
    :background,
    :images,
    :input_fidelity,
    :mask,
    :model,
    :moderation,
    :n,
    :output_compression,
    :output_format,
    :partial_images,
    :prompt,
    :quality,
    :size,
    :stream,
    :user
  ]
end
