defmodule ExOpenAI.Components.BetaComputerScreenshotImage do
  use ExOpenAI.Jason

  @moduledoc """
  A computer screenshot image used with the computer use tool.


  ## Fields

  * `:file_id` - **optional** - `String.t()`
    The identifier of an uploaded file that contains the screenshot.

  * `:image_url` - **optional** - `String.t()`
    The URL of the screenshot image.
    Format: `uri`

  * `:type` - **required** - `:computer_screenshot`
    Specifies the event type. For a computer screenshot, this property is
  always set to `computer_screenshot`.
    Allowed values: `"computer_screenshot"`
    Default: `"computer_screenshot"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file_id: String.t() | nil,
          image_url: String.t() | nil,
          type: :computer_screenshot
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:file_id) => String.t(),
              optional(:image_url) => String.t(),
              required(:type) => :computer_screenshot | String.t()
            }
  defstruct [:file_id, :image_url, :type]
end
