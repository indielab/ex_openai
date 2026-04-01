defmodule ExOpenAI.Components.CreateImageEditRequest do
  use ExOpenAI.Jason

  @moduledoc """
  Module for representing the OpenAI schema CreateImageEditRequest.

  ## Fields

  * `:background` - **optional** - `:transparent | :opaque | :auto | nil`  
    Allows to set transparency for the background of the generated image(s).
  This parameter is only supported for the GPT image models. Must be one of
  `transparent`, `opaque` or `auto` (default value). When `auto` is used, the
  model will automatically determine the best background for the image.

  If `transparent`, the output format needs to support transparency, so it
  should be set to either `png` (default value) or `webp`.  
    Allowed values: `"transparent"`, `"opaque"`, `"auto"`  
    Default: `"auto"`

  * `:image` - **required** - `binary() | [binary()]`  
    The image(s) to edit. Must be a supported image file or an array of images.

  For the GPT image models (`gpt-image-1`, `gpt-image-1-mini`, and `gpt-image-1.5`), each image should be a `png`, `webp`, or `jpg`
  file less than 50MB. You can provide up to 16 images.
  `chatgpt-image-latest` follows the same input constraints as GPT image models.

  For `dall-e-2`, you can only provide one image, and it should be a square
  `png` file less than 4MB.

  * `:input_fidelity` - **optional** - `ExOpenAI.Components.InputFidelity.t() | any()`

  * `:mask` - **optional** - `binary()`  
    An additional image whose fully transparent areas (e.g. where alpha is zero) indicate where `image` should be edited. If there are multiple images provided, the mask will be applied on the first image. Must be a valid PNG file, less than 4MB, and have the same dimensions as `image`.  
    Format: `binary`

  * `:model` - **optional** - `String.t() | :"gpt-image-1.5" | :"dall-e-2" | :"gpt-image-1" | :"gpt-image-1-mini" | :"chatgpt-image-latest" | nil`  
    The model to use for image generation. Defaults to `gpt-image-1.5`.  
    Default: `"gpt-image-1.5"`

  * `:n` - **optional** - `integer() | nil`  
    The number of images to generate. Must be between 1 and 10.  
    Default: `1`  
    Constraints: minimum: 1, maximum: 10

  * `:output_compression` - **optional** - `integer() | nil`  
    The compression level (0-100%) for the generated images. This parameter
  is only supported for the GPT image models with the `webp` or `jpeg` output
  formats, and defaults to 100.  
    Default: `100`

  * `:output_format` - **optional** - `:png | :jpeg | :webp | nil`  
    The format in which the generated images are returned. This parameter is
  only supported for the GPT image models. Must be one of `png`, `jpeg`, or `webp`.
  The default value is `png`.  
    Allowed values: `"png"`, `"jpeg"`, `"webp"`  
    Default: `"png"`

  * `:partial_images` - **optional** - `ExOpenAI.Components.PartialImages.t()`

  * `:prompt` - **required** - `String.t()`  
    A text description of the desired image(s). The maximum length is 1000 characters for `dall-e-2`, and 32000 characters for the GPT image models.

  * `:quality` - **optional** - `:standard | :low | :medium | :high | :auto | nil`  
    The quality of the image that will be generated for GPT image models. Defaults to `auto`.  
    Allowed values: `"standard"`, `"low"`, `"medium"`, `"high"`, `"auto"`  
    Default: `"auto"`

  * `:response_format` - **optional** - `:url | :b64_json | nil`  
    The format in which the generated images are returned. Must be one of `url` or `b64_json`. URLs are only valid for 60 minutes after the image has been generated. This parameter is only supported for `dall-e-2` (default is `url` for `dall-e-2`), as GPT image models always return base64-encoded images.  
    Allowed values: `"url"`, `"b64_json"`

  * `:size` - **optional** - `:"256x256" | :"512x512" | :"1024x1024" | :"1536x1024" | :"1024x1536" | :auto | nil`  
    The size of the generated images. Must be one of `1024x1024`, `1536x1024` (landscape), `1024x1536` (portrait), or `auto` (default value) for the GPT image models, and one of `256x256`, `512x512`, or `1024x1024` for `dall-e-2`.  
    Allowed values: `"256x256"`, `"512x512"`, `"1024x1024"`, `"1536x1024"`, `"1024x1536"`, `"auto"`  
    Default: `"1024x1024"`

  * `:stream` - **optional** - `boolean() | nil`  
    Edit the image in streaming mode. Defaults to `false`. See the
  [Image generation guide](/docs/guides/image-generation) for more information.  
    Default: `false`

  * `:user` - **optional** - `String.t()`  
    A unique identifier representing your end-user, which can help OpenAI to monitor and detect abuse. [Learn more](/docs/guides/safety-best-practices#end-user-ids).
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: ((:transparent | :opaque) | :auto) | nil,
          image: binary() | list(binary()),
          input_fidelity: (ExOpenAI.Components.InputFidelity.t() | any()) | nil,
          mask: binary() | nil,
          model:
            (String.t()
             | (((:"gpt-image-1.5" | :"dall-e-2") | :"gpt-image-1") | :"gpt-image-1-mini")
             | :"chatgpt-image-latest")
            | nil,
          n: integer() | nil,
          output_compression: integer() | nil,
          output_format: ((:png | :jpeg) | :webp) | nil,
          partial_images: ExOpenAI.Components.PartialImages.t() | nil,
          prompt: String.t(),
          quality: ((((:standard | :low) | :medium) | :high) | :auto) | nil,
          response_format: (:url | :b64_json) | nil,
          size:
            (((((:"256x256" | :"512x512") | :"1024x1024") | :"1536x1024") | :"1024x1536") | :auto)
            | nil,
          stream: boolean() | nil,
          user: String.t() | nil
        }
  defstruct [
    :background,
    :image,
    :input_fidelity,
    :mask,
    :model,
    :n,
    :output_compression,
    :output_format,
    :partial_images,
    :prompt,
    :quality,
    :response_format,
    :size,
    :stream,
    :user
  ]
end
