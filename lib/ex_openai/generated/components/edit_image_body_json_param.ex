defmodule ExOpenAI.Components.EditImageBodyJsonParam do
  use ExOpenAI.Jason

  @moduledoc """
  JSON request body for image edits.

  Use `images` (array of `ImageRefParam`) instead of multipart `image` uploads.
  You can reference images via external URLs, data URLs, or uploaded file IDs.
  JSON edits support GPT image models only; DALL-E edits require multipart (`dall-e-2` only).


  ## Fields

  * `:background` - **optional** - `:transparent | :opaque | :auto | nil`
    Background behavior for generated image output.
    Default: `"auto"`

  * `:images` - **required** - `list(ExOpenAI.Components.ImageRefParam.t())`
    Input image references to edit.
  For GPT image models, you can provide up to 16 images.
    Constraints: minItems: 1, maxItems: 16

  * `:input_fidelity` - **optional** - `:high | :low | nil`
    Controls fidelity to the original input image(s).

  * `:mask` - **optional** - `ExOpenAI.Components.ImageRefParam.t()`

  * `:model` - **optional** - `String.t() | :"gpt-image-1.5" | :"gpt-image-1" | :"gpt-image-1-mini" | :"chatgpt-image-latest" | nil`
    The model to use for image editing.
    Default: `"gpt-image-1.5"`

  * `:moderation` - **optional** - `:low | :auto | nil`
    Moderation level for GPT image models.
    Default: `"auto"`

  * `:n` - **optional** - `integer() | nil`
    The number of edited images to generate.
    Default: `1`

  * `:output_compression` - **optional** - `integer() | nil`
    Compression level for `jpeg` or `webp` output.

  * `:output_format` - **optional** - `:png | :jpeg | :webp | nil`
    Output image format. Supported for GPT image models.
    Default: `"png"`

  * `:partial_images` - **optional** - `ExOpenAI.Components.PartialImages.t()`

  * `:prompt` - **required** - `String.t()`
    A text description of the desired image edit.
    Constraints: minLength: 1, maxLength: 32000

  * `:quality` - **optional** - `:low | :medium | :high | :auto | nil`
    Output quality for GPT image models.
    Default: `"auto"`

  * `:size` - **optional** - `:auto | :"1024x1024" | :"1536x1024" | :"1024x1536" | nil`
    Requested output image size.
    Default: `"auto"`

  * `:stream` - **optional** - `boolean() | nil`
    Stream partial image results as events.
    Default: `false`

  * `:user` - **optional** - `String.t()`
    A unique identifier representing your end-user, which can help OpenAI
  monitor and detect abuse.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (((:transparent | :opaque) | :auto) | nil) | nil,
          images: list(ExOpenAI.Components.ImageRefParam.t()),
          input_fidelity: ((:high | :low) | nil) | nil,
          mask: ExOpenAI.Components.ImageRefParam.t() | nil,
          model:
            ((String.t()
              | ((:"gpt-image-1.5" | :"gpt-image-1") | :"gpt-image-1-mini")
              | :"chatgpt-image-latest")
             | nil)
            | nil,
          moderation: ((:low | :auto) | nil) | nil,
          n: (integer() | nil) | nil,
          output_compression: (integer() | nil) | nil,
          output_format: (((:png | :jpeg) | :webp) | nil) | nil,
          partial_images: ExOpenAI.Components.PartialImages.t() | nil,
          prompt: String.t(),
          quality: ((((:low | :medium) | :high) | :auto) | nil) | nil,
          size: ((((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | nil) | nil,
          stream: (boolean() | nil) | nil,
          user: String.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:background) => (((:transparent | :opaque) | :auto) | String.t()) | nil,
              required(:images) => list(ExOpenAI.Components.ImageRefParam.input()),
              optional(:input_fidelity) => ((:high | :low) | String.t()) | nil,
              optional(:mask) => ExOpenAI.Components.ImageRefParam.input(),
              optional(:model) =>
                (String.t()
                 | (((:"gpt-image-1.5" | :"gpt-image-1") | :"gpt-image-1-mini")
                    | :"chatgpt-image-latest")
                 | String.t())
                | nil,
              optional(:moderation) => ((:low | :auto) | String.t()) | nil,
              optional(:n) => integer() | nil,
              optional(:output_compression) => integer() | nil,
              optional(:output_format) => (((:png | :jpeg) | :webp) | String.t()) | nil,
              optional(:partial_images) => ExOpenAI.Components.PartialImages.input(),
              required(:prompt) => String.t(),
              optional(:quality) => ((((:low | :medium) | :high) | :auto) | String.t()) | nil,
              optional(:size) =>
                ((((:auto | :"1024x1024") | :"1536x1024") | :"1024x1536") | String.t()) | nil,
              optional(:stream) => boolean() | nil,
              optional(:user) => String.t()
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
