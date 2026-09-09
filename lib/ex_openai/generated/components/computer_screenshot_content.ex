defmodule ExOpenAI.Components.ComputerScreenshotContent do
  use ExOpenAI.Jason

  @moduledoc """
  A screenshot of a computer.

  ## Fields

  * `:detail` - **required** - `ExOpenAI.Components.ImageDetail.t()`
    The detail level of the screenshot image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.

  * `:file_id` - **required** - `String.t() | nil`

  * `:image_url` - **required** - `String.t() | nil`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointConfig.t()`

  * `:type` - **required** - `:computer_screenshot`
    Specifies the event type. For a computer screenshot, this property is always set to `computer_screenshot`.
    Allowed values: `"computer_screenshot"`
    Default: `"computer_screenshot"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.ImageDetail.t(),
          file_id: String.t() | nil,
          image_url: String.t() | nil,
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointConfig.t() | nil,
          type: :computer_screenshot
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:detail) => ExOpenAI.Components.ImageDetail.input(),
              required(:file_id) => String.t() | nil,
              required(:image_url) => String.t() | nil,
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointConfig.input(),
              required(:type) => :computer_screenshot | String.t()
            }
  defstruct [:detail, :file_id, :image_url, :prompt_cache_breakpoint, :type]
end
