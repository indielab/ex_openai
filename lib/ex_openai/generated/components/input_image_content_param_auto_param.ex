defmodule ExOpenAI.Components.InputImageContentParamAutoParam do
  use ExOpenAI.Jason

  @moduledoc """
  An image input to the model. Learn about [image inputs](https://platform.openai.com/docs/guides/vision)

  ## Fields

  * `:detail` - **optional** - `ExOpenAI.Components.DetailEnum.t() | nil`

  * `:file_id` - **optional** - `String.t() | nil`

  * `:image_url` - **optional** - `String.t() | nil`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil`

  * `:type` - **required** - `:input_image`
    The type of the input item. Always `input_image`.
    Allowed values: `"input_image"`
    Default: `"input_image"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: (ExOpenAI.Components.DetailEnum.t() | nil) | nil,
          file_id: (String.t() | nil) | nil,
          image_url: (String.t() | nil) | nil,
          prompt_cache_breakpoint:
            (ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil) | nil,
          type: :input_image
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:detail) => ExOpenAI.Components.DetailEnum.input() | nil,
              optional(:file_id) => String.t() | nil,
              optional(:image_url) => String.t() | nil,
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointParam.input() | nil,
              required(:type) => :input_image | String.t()
            }
  defstruct [:detail, :file_id, :image_url, :prompt_cache_breakpoint, :type]
end
