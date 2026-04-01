defmodule ExOpenAI.Components.ImageEditPartialImageEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when a partial image is available during image editing streaming.


  ## Fields

  * `:b64_json` - **required** - `String.t()`  
    Base64-encoded partial image data, suitable for rendering as an image.

  * `:background` - **required** - `:transparent | :opaque | :auto`  
    The background setting for the requested edited image.  
    Allowed values: `"transparent"`, `"opaque"`, `"auto"`

  * `:created_at` - **required** - `integer()`  
    The Unix timestamp when the event was created.

  * `:output_format` - **required** - `:png | :webp | :jpeg`  
    The output format for the requested edited image.  
    Allowed values: `"png"`, `"webp"`, `"jpeg"`

  * `:partial_image_index` - **required** - `integer()`  
    0-based index for the partial image (streaming).

  * `:quality` - **required** - `:low | :medium | :high | :auto`  
    The quality setting for the requested edited image.  
    Allowed values: `"low"`, `"medium"`, `"high"`, `"auto"`

  * `:size` - **required** - `:"1024x1024" | :"1024x1536" | :"1536x1024" | :auto`  
    The size of the requested edited image.  
    Allowed values: `"1024x1024"`, `"1024x1536"`, `"1536x1024"`, `"auto"`

  * `:type` - **required** - `:"image_edit.partial_image"`  
    The type of the event. Always `image_edit.partial_image`.  
    Allowed values: `"image_edit.partial_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          b64_json: String.t(),
          background: (:transparent | :opaque) | :auto,
          created_at: integer(),
          output_format: (:png | :webp) | :jpeg,
          partial_image_index: integer(),
          quality: ((:low | :medium) | :high) | :auto,
          size: ((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto,
          type: :"image_edit.partial_image"
        }
  defstruct [
    :b64_json,
    :background,
    :created_at,
    :output_format,
    :partial_image_index,
    :quality,
    :size,
    :type
  ]
end
