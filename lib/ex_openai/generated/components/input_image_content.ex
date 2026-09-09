defmodule ExOpenAI.Components.InputImageContent do
  use ExOpenAI.Jason

  @moduledoc """
  An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision).

  ## Fields

  * `:detail` - **required** - `ExOpenAI.Components.ImageDetail.t()`
    The detail level of the image to be sent to the model. One of `high`, `low`, `auto`, or `original`. Defaults to `auto`.

  * `:file_id` - **optional** - `String.t() | nil`

  * `:image_url` - **optional** - `String.t() | nil`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointConfig.t()`

  * `:type` - **required** - `:input_image`
    The type of the input item. Always `input_image`.
    Allowed values: `"input_image"`
    Default: `"input_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.ImageDetail.t(),
          file_id: (String.t() | nil) | nil,
          image_url: (String.t() | nil) | nil,
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointConfig.t() | nil,
          type: :input_image
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:detail) => ExOpenAI.Components.ImageDetail.input(),
              optional(:file_id) => String.t() | nil,
              optional(:image_url) => String.t() | nil,
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointConfig.input(),
              required(:type) => :input_image | String.t()
            }
  defstruct [:detail, :file_id, :image_url, :prompt_cache_breakpoint, :type]
end
