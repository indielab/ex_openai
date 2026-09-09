defmodule ExOpenAI.Components.ImageEditCompletedEvent do
  use ExOpenAI.Jason

  @moduledoc """
  Emitted when image editing has completed and the final image is available.


  ## Fields

  * `:b64_json` - **required** - `String.t()`
    Base64-encoded final edited image data, suitable for rendering as an image.

  * `:background` - **required** - `:transparent | :opaque | :auto`
    The background setting for the edited image.
    Allowed values: `"transparent"`, `"opaque"`, `"auto"`

  * `:created_at` - **required** - `integer()`
    The Unix timestamp when the event was created.
    Format: `unixtime`

  * `:output_format` - **required** - `:png | :webp | :jpeg`
    The output format for the edited image.
    Allowed values: `"png"`, `"webp"`, `"jpeg"`

  * `:quality` - **required** - `:low | :medium | :high | :auto`
    The quality setting for the edited image.
    Allowed values: `"low"`, `"medium"`, `"high"`, `"auto"`

  * `:size` - **required** - `:"1024x1024" | :"1024x1536" | :"1536x1024" | :auto`
    The size of the edited image.
    Allowed values: `"1024x1024"`, `"1024x1536"`, `"1536x1024"`, `"auto"`

  * `:type` - **required** - `:"image_edit.completed"`
    The type of the event. Always `image_edit.completed`.
    Allowed values: `"image_edit.completed"`

  * `:usage` - **required** - `ExOpenAI.Components.ImagesUsage.t()`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          b64_json: String.t(),
          background: (:transparent | :opaque) | :auto,
          created_at: integer(),
          output_format: (:png | :webp) | :jpeg,
          quality: ((:low | :medium) | :high) | :auto,
          size: ((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto,
          type: :"image_edit.completed",
          usage: ExOpenAI.Components.ImagesUsage.t()
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:b64_json) => String.t(),
              required(:background) => ((:transparent | :opaque) | :auto) | String.t(),
              required(:created_at) => integer(),
              required(:output_format) => ((:png | :webp) | :jpeg) | String.t(),
              required(:quality) => (((:low | :medium) | :high) | :auto) | String.t(),
              required(:size) =>
                (((:"1024x1024" | :"1024x1536") | :"1536x1024") | :auto) | String.t(),
              required(:type) => :"image_edit.completed" | String.t(),
              required(:usage) => ExOpenAI.Components.ImagesUsage.input()
            }
  defstruct [:b64_json, :background, :created_at, :output_format, :quality, :size, :type, :usage]
end
