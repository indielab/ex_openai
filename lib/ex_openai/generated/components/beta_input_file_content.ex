defmodule ExOpenAI.Components.BetaInputFileContent do
  use ExOpenAI.Jason

  @moduledoc """
  A file input to the model.

  ## Fields

  * `:detail` - **optional** - `ExOpenAI.Components.BetaFileInputDetail.t()`
    The detail level of the file to be sent to the model. Use `auto` to let the system select the detail level; for GPT-5.6 and later models, `auto` uses high-quality rendering, which may increase input token usage. Use `low` for lower-cost rendering, or `high` to render the file at higher quality. Defaults to `auto`.

  * `:file_data` - **optional** - `String.t()`
    The content of the file to be sent to the model.

  * `:file_id` - **optional** - `String.t() | nil`

  * `:file_url` - **optional** - `String.t()`
    The URL of the file to be sent to the model.
    Format: `uri`

  * `:filename` - **optional** - `String.t()`
    The name of the file to be sent to the model.

  * `:prompt_cache_breakpoint` - **optional** - `ExOpenAI.Components.BetaPromptCacheBreakpointConfig.t()`

  * `:type` - **required** - `:input_file`
    The type of the input item. Always `input_file`.
    Allowed values: `"input_file"`
    Default: `"input_file"`
  """
  @type t() :: %{
          __struct__: __MODULE__,
          detail: ExOpenAI.Components.BetaFileInputDetail.t() | nil,
          file_data: String.t() | nil,
          file_id: (String.t() | nil) | nil,
          file_url: String.t() | nil,
          filename: String.t() | nil,
          prompt_cache_breakpoint: ExOpenAI.Components.BetaPromptCacheBreakpointConfig.t() | nil,
          type: :input_file
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:detail) => ExOpenAI.Components.BetaFileInputDetail.input(),
              optional(:file_data) => String.t(),
              optional(:file_id) => String.t() | nil,
              optional(:file_url) => String.t(),
              optional(:filename) => String.t(),
              optional(:prompt_cache_breakpoint) =>
                ExOpenAI.Components.BetaPromptCacheBreakpointConfig.input(),
              required(:type) => :input_file | String.t()
            }
  defstruct [:detail, :file_data, :file_id, :file_url, :filename, :prompt_cache_breakpoint, :type]
end
