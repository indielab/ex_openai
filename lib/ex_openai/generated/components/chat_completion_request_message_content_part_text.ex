defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartText do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [text inputs](https://platform.openai.com/docs/guides/text-generation).


  ## Fields

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointParam.t()`

  * `:text` - **required** - `String.t()`
    The text content.

  * `:type` - **required** - `:text`
    The type of the content part.
    Allowed values: `"text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil,
          text: String.t(),
          type: :text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointParam.input(),
              required(:text) => String.t(),
              required(:type) => :text | String.t()
            }
  defstruct [:prompt_cache_breakpoint, :text, :type]
end
