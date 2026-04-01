defmodule ExOpenAI.Components.InputImageContentParamAutoParam do
  use ExOpenAI.Jason

  @moduledoc """
  An image input to the model. Learn about [image inputs](/docs/guides/vision)

  ## Fields

  * `:detail` - **optional** - `ExOpenAI.Components.DetailEnum.t() | any()`

  * `:file_id` - **optional** - `String.t() | any()`

  * `:image_url` - **optional** - `String.t() | any()`

  * `:type` - **required** - `:input_image`  
    The type of the input item. Always `input_image`.  
    Allowed values: `"input_image"`  
    Default: `"input_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: (ExOpenAI.Components.DetailEnum.t() | any()) | nil,
          file_id: (String.t() | any()) | nil,
          image_url: (String.t() | any()) | nil,
          type: :input_image
        }
  defstruct [:detail, :file_id, :image_url, :type]
end
