defmodule ExOpenAI.Components.EvalItemInputImage do
  use ExOpenAI.Jason

  @moduledoc """
  An image input block used within EvalItem content arrays.

  ## Fields

  * `:detail` - **optional** - `String.t()`  
    The detail level of the image to be sent to the model. One of `high`, `low`, or `auto`. Defaults to `auto`.

  * `:image_url` - **required** - `String.t()`  
    The URL of the image input.

  * `:type` - **required** - `:input_image`  
    The type of the image input. Always `input_image`.  
    Allowed values: `"input_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: String.t() | nil,
          image_url: String.t(),
          type: :input_image
        }
  defstruct [:detail, :image_url, :type]
end
