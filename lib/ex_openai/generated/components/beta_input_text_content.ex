defmodule ExOpenAI.Components.BetaInputTextContent do
  use ExOpenAI.Jason

  @moduledoc """
  A text input to the model.

  ## Fields

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.BetaPromptCacheBreakpointConfig.t()`

  * `:text` - **required** - `String.t()`
    The text input to the model.

  * `:type` - **required** - `:input_text`
    The type of the input item. Always `input_text`.
    Allowed values: `"input_text"`
    Default: `"input_text"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          prompt_cache_breakpoint: ExOpenAI.Components.BetaPromptCacheBreakpointConfig.t() | nil,
          text: String.t(),
          type: :input_text
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.BetaPromptCacheBreakpointConfig.input(),
              required(:text) => String.t(),
              required(:type) => :input_text | String.t()
            }
  defstruct [:prompt_cache_breakpoint, :text, :type]
end
