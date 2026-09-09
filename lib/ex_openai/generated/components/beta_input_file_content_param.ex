defmodule ExOpenAI.Components.BetaInputFileContentParam do
  use ExOpenAI.Jason

  @moduledoc """
  A file input to the model.

  ## Fields

  * `:detail` - **optional** - `ExOpenAI.Components.BetaFileDetailEnum.t()`
    The detail level of the file to be sent to the model. Use `auto` to let the system select the detail level; for GPT-5.6 and later models, `auto` uses high-quality rendering, which may increase input token usage. Use `low` for lower-cost rendering, or `high` to render the file at higher quality. Defaults to `auto`.

  * `:file_data` - **optional** - `String.t() | nil`

  * `:file_id` - **optional** - `String.t() | nil`

  * `:file_url` - **optional** - `String.t() | nil`

  * `:filename` - **optional** - `String.t() | nil`

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.BetaPromptCacheBreakpointParam.t() | nil`

  * `:type` - **required** - `:input_file`
    The type of the input item. Always `input_file`.
    Allowed values: `"input_file"`
    Default: `"input_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.BetaFileDetailEnum.t() | nil,
          file_data: (String.t() | nil) | nil,
          file_id: (String.t() | nil) | nil,
          file_url: (String.t() | nil) | nil,
          filename: (String.t() | nil) | nil,
          prompt_cache_breakpoint:
            (ExOpenAI.Components.BetaPromptCacheBreakpointParam.t() | nil) | nil,
          type: :input_file
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:detail) => ExOpenAI.Components.BetaFileDetailEnum.input(),
              optional(:file_data) => String.t() | nil,
              optional(:file_id) => String.t() | nil,
              optional(:file_url) => String.t() | nil,
              optional(:filename) => String.t() | nil,
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.BetaPromptCacheBreakpointParam.input() | nil,
              required(:type) => :input_file | String.t()
            }
  defstruct [:detail, :file_data, :file_id, :file_url, :filename, :prompt_cache_breakpoint, :type]
end
