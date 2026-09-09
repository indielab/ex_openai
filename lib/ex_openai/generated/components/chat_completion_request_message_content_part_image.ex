defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartImage do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [image inputs](https://platform.openai.com/docs/guides/vision).


  ## Fields

  * `:image_url` - **required** - `%{optional(:detail) => :auto | :low | :high, required(:url) => String.t()}`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointParam.t()`

  * `:type` - **required** - `:image_url`
    The type of the content part.
    Allowed values: `"image_url"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          image_url: %{optional(:detail) => (:auto | :low) | :high, required(:url) => String.t()},
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil,
          type: :image_url
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:image_url) => %{
                optional(:detail) => ((:auto | :low) | :high) | String.t(),
                required(:url) => String.t()
              },
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointParam.input(),
              required(:type) => :image_url | String.t()
            }
  defstruct [:image_url, :prompt_cache_breakpoint, :type]
end
