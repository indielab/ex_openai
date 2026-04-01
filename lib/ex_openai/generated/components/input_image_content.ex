defmodule ExOpenAI.Components.InputImageContent do
  use ExOpenAI.Jason

  @moduledoc """
  An image input to the model. Learn about [image inputs](/docs/guides/vision).

  ## Fields

  * `:detail` - **required** - `ExOpenAI.Components.ImageDetail.t()`  
    The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.

  * `:file_id` - **optional** - `String.t() | any()`

  * `:image_url` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:input_image`  
    The type of the input item. Always `input_image`.  
    Allowed values: `"input_image"`  
    Default: `"input_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.ImageDetail.t(),
          file_id: (String.t() | any()) | nil,
          image_url: (String.t() | any()) | nil,
          type: :input_image
        }
  defstruct [:detail, :file_id, :image_url, :type]
end
