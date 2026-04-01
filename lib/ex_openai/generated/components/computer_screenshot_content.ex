defmodule ExOpenAI.Components.ComputerScreenshotContent do
  use ExOpenAI.Jason

  @moduledoc """
  A screenshot of a computer.

  ## Fields

  * `:detail` - **required** - `ExOpenAI.Components.ImageDetail.t()`  
    The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.

  * `:file_id` - **required** - `String.t() | any()`

  * `:image_url` - **required** - `String.t() | any()`

  * `:type` - **required** - `:computer_screenshot`  
    Specifies the event type. For a computer screenshot, this property is always set to `computer_screenshot`.  
    Allowed values: `"computer_screenshot"`  
    Default: `"computer_screenshot"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.ImageDetail.t(),
          file_id: String.t() | any(),
          image_url: String.t() | any(),
          type: :computer_screenshot
        }
  defstruct [:detail, :file_id, :image_url, :type]
end
