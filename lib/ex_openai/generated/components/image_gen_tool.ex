defmodule ExOpenAI.Components.ImageGenTool do
  use ExOpenAI.Jason

  @moduledoc """
  A tool that generates images using the GPT image models.


  ## Fields

  * `:action` - **optional** - `ExOpenAI.Components.ImageGenActionEnum.t()`  
    Whether to generate a new image or edit an existing image. Default: `auto`.

  * `:background` - **optional** - `:transparent | :opaque | :auto`  
    Background type for the generated image. One of `transparent`,
  `opaque`, or `auto`. Default: `auto`.  
    Allowed values: `"transparent"`, `"opaque"`, `"auto"`  
    Default: `"auto"`

  * `:input_fidelity` - **optional** - `ExOpenAI.Components.InputFidelity.t() | any()`

  * `:input_image_mask` - **optional** - `{:%{}, [], [{{:optional, [], [:file_id]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}, {{:optional, [], [:image_url]}, {{:., [], [{:__aliases__, [alias: false], [:String]}, :t]}, [], []}}]}`  
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

  * `:size` - **optional** - `:"1024x1024" | :"1024x1536" | :"1536x1024" | :auto`  
    The size of the generated image. One of `1024x1024`, `1024x1536`,
  `1536x1024`, or `auto`. Default: `auto`.  
    Allowed values: `"1024x1024"`, `"1024x1536"`, `"1536x1024"`, `"auto"`  
    Default: `"auto"`

  * `:type` - **required** - `:image_generation`  
    The type of the image generation tool. Always `image_generation`.  
    Allowed values: `"image_generation"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          action: ExOpenAI.Components.ImageGenActionEnum.t() | nil,
          background: ((:transparent | :opaque) | :auto) | nil,
          input_fidelity: (ExOpenAI.Components.InputFidelity.t() | any()) | nil,
          input_image_mask:
            %{optional(:file_id) => String.t(), optional(:image_url) => String.t()} | nil,
          model: (String.t() | (:"gpt-image-1" | :"gpt-image-1-mini") | :"gpt-image-1.5") | nil,
          moderation: (:auto | :low) | nil,
          output_compression: integer() | nil,
          output_format: ((:png | :webp) | :jpeg) | nil,
          partial_images: integer() | nil,
          quality: (((:low | :medium) | :high) | :auto) | nil,
          size: (((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto) | nil,
          type: :image_generation
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
