defmodule ExOpenAI.Components.ImagesResponse do
  use ExOpenAI.Jason

  @moduledoc """
  The response from the image generation endpoint.

  ## Fields

  * `:background` - **optional** - `:transparent | :opaque`  
    The background parameter used for the image generation. Either `transparent` or `opaque`.  
    Allowed values: `"transparent"`, `"opaque"`

  * `:created` - **required** - `integer()`  
    The Unix timestamp (in seconds) of when the image was created.

  * `:data` - **optional** - `[ExOpenAI.Components.Image.t()]`  
    The list of generated images.

  * `:output_format` - **optional** - `:png | :webp | :jpeg`  
    The output format of the image generation. Either `png`, `webp`, or `jpeg`.  
    Allowed values: `"png"`, `"webp"`, `"jpeg"`

  * `:quality` - **optional** - `:low | :medium | :high`  
    The quality of the image generated. Either `low`, `medium`, or `high`.  
    Allowed values: `"low"`, `"medium"`, `"high"`

  * `:size` - **optional** - `:"1024x1024" | :"1024x1536" | :"1536x1024"`  
    The size of the image generated. Either `1024x1024`, `1024x1536`, or `1536x1024`.  
    Allowed values: `"1024x1024"`, `"1024x1536"`, `"1536x1024"`

  * `:usage` - **optional** - `ExOpenAI.Components.ImageGenUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          background: (:transparent | :opaque) | nil,
          created: integer(),
          data: list(ExOpenAI.Components.Image.t()) | nil,
          output_format: ((:png | :webp) | :jpeg) | nil,
          quality: ((:low | :medium) | :high) | nil,
          size: ((:"1024x1024" | :"1024x1536") | :"1536x1024") | nil,
          usage: ExOpenAI.Components.ImageGenUsage.t() | nil
        }
  defstruct [:background, :created, :data, :output_format, :quality, :size, :usage]
end
