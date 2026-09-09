defmodule ExOpenAI.Components.BetaImageGenTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that generates images using the GPT image models.


  ## Fields

  * `:action` - **optional** - `ExOpenAI.Components.BetaImageGenActionEnum.t()`
    Whether to generate a new image or edit an existing image. Default: `auto`.

  * `:background` - **optional** - `:transparent | :opaque | :auto`
    Background type for the generated image. One of `transparent`,
  `opaque`, or `auto`. Default: `auto`.
    Allowed values: `"transparent"`, `"opaque"`, `"auto"`
    Default: `"auto"`

  * `:input_fidelity` - **optional** - `ExOpenAI.Components.BetaInputFidelity.t() | nil`

  * `:input_image_mask` - **optional** - `%{optional(:file_id) => String.t(), optional(:image_url) => String.t()}`
    Optional mask for inpainting. Contains `image_url`
  (string, optional) and `file_id` (string, optional).

  * `:model` - **optional** - `String.t() | :"gpt-image-1" | :"gpt-image-1-mini" | :"gpt-image-1.5"`

  * `:moderation` - **optional** - `:auto | :low`
    Moderation level for the generated image. Default: `auto`.
    Allowed values: `"auto"`, `"low"`
    Default: `"auto"`

  * `:output_compression` - **optional** - `integer()`
    Compression level for the output image. Default: 100.
    Default: `100`
    Constraints: minimum: 0, maximum: 100

  * `:output_format` - **optional** - `:png | :webp | :jpeg`
    The output format of the generated image. One of `png`, `webp`, or
  `jpeg`. Default: `png`.
    Allowed values: `"png"`, `"webp"`, `"jpeg"`
    Default: `"png"`

  * `:partial_images` - **optional** - `integer()`
    Number of partial images to generate in streaming mode, from 0 (default value) to 3.
    Default: `0`
    Constraints: minimum: 0, maximum: 3

  * `:quality` - **optional** - `:low | :medium | :high | :auto`
    The quality of the generated image. One of `low`, `medium`, `high`,
  or `auto`. Default: `auto`.
    Allowed values: `"low"`, `"medium"`, `"high"`, `"auto"`
    Default: `"auto"`

  * `:size` - **optional** - `String.t() | :"1024x1024" | :"1024x1536" | :"1536x1024" | :auto`
    The size of the generated images. For `gpt-image-2` and `gpt-image-2-2026-04-21`, arbitrary resolutions are supported as `WIDTHxHEIGHT` strings, for example `1536x864`. Width and height must both be divisible by 16 and the requested aspect ratio must be between 1:3 and 3:1. Resolutions above `2560x1440` are experimental, and the maximum supported resolution is `3840x2160`. The requested size must also satisfy the model's current pixel and edge limits. The standard sizes `1024x1024`, `1536x1024`, and `1024x1536` are supported by the GPT image models; `auto` is supported for models that allow automatic sizing. For `dall-e-2`, use one of `256x256`, `512x512`, or `1024x1024`. For `dall-e-3`, use one of `1024x1024`, `1792x1024`, or `1024x1792`.
    Default: `"auto"`

  * `:type` - **required** - `:image_generation`
    The type of the image generation tool. Always `image_generation`.
    Allowed values: `"image_generation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.BetaImageGenActionEnum.t() | nil,
          background: ((:transparent | :opaque) | :auto) | nil,
          input_fidelity: (ExOpenAI.Components.BetaInputFidelity.t() | nil) | nil,
          input_image_mask:
            %{optional(:file_id) => String.t(), optional(:image_url) => String.t()} | nil,
          model: (String.t() | (:"gpt-image-1" | :"gpt-image-1-mini") | :"gpt-image-1.5") | nil,
          moderation: (:auto | :low) | nil,
          output_compression: integer() | nil,
          output_format: ((:png | :webp) | :jpeg) | nil,
          partial_images: integer() | nil,
          quality: (((:low | :medium) | :high) | :auto) | nil,
          size: (String.t() | ((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto) | nil,
          type: :image_generation
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:action) => ExOpenAI.Components.BetaImageGenActionEnum.input(),
              optional(:background) => ((:transparent | :opaque) | :auto) | String.t(),
              optional(:input_fidelity) => ExOpenAI.Components.BetaInputFidelity.input() | nil,
              optional(:input_image_mask) => %{
                optional(:file_id) => String.t(),
                optional(:image_url) => String.t()
              },
              optional(:model) =>
                String.t()
                | ((:"gpt-image-1" | :"gpt-image-1-mini") | :"gpt-image-1.5")
                | String.t(),
              optional(:moderation) => (:auto | :low) | String.t(),
              optional(:output_compression) => integer(),
              optional(:output_format) => ((:png | :webp) | :jpeg) | String.t(),
              optional(:partial_images) => integer(),
              optional(:quality) => (((:low | :medium) | :high) | :auto) | String.t(),
              optional(:size) =>
                String.t() | (((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto) | String.t(),
              required(:type) => :image_generation | String.t()
            }
  defstruct [
    :action,
    :background,
    :input_fidelity,
    :input_image_mask,
    :model,
    :moderation,
    :output_compression,
    :output_format,
    :partial_images,
    :quality,
    :size,
    :type
  ]
end
