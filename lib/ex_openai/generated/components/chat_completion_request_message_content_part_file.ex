defmodule ExOpenAI.Components.ChatCompletionRequestMessageContentPartFile do
  use ExOpenAI.Jason

  @moduledoc """
  Learn about [file inputs](https://platform.openai.com/docs/guides/text) for text generation.


  ## Fields

  * `:file` - **required** - `%{ optional(:file_data) => String.t(), optional(:file_id) => String.t(), optional(:filename) => String.t() }`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.PromptCacheBreakpointParam.t()`

  * `:type` - **required** - `:file`
    The type of the content part. Always `file`.
    Allowed values: `"file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          file: %{
            optional(:file_data) => String.t(),
            optional(:file_id) => String.t(),
            optional(:filename) => String.t()
          },
          prompt_cache_breakpoint: ExOpenAI.Components.PromptCacheBreakpointParam.t() | nil,
          type: :file
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              required(:file) => %{
                optional(:file_data) => String.t(),
                optional(:file_id) => String.t(),
                optional(:filename) => String.t()
              },
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.PromptCacheBreakpointParam.input(),
              required(:type) => :file | String.t()
            }
  defstruct [:file, :prompt_cache_breakpoint, :type]
end
