defmodule ExOpenAI.Components.PromptCacheOptionsParam do
  use ExOpenAI.Jason

  @moduledoc """
  Options for prompt caching. Supported for `gpt-5.6` and later models. By default, OpenAI automatically chooses one implicit cache breakpoint. You can add explicit breakpoints to content blocks with `prompt_cache_breakpoint`. Each request can write up to four breakpoints. For cache matching, OpenAI considers up to the latest 80 breakpoints in the conversation, without a content-block lookback limit. Set `mode` to `explicit` to disable the implicit breakpoint. The `ttl` defaults to `30m`, which is currently the only supported value. See the [prompt caching guide](https://platform.openai.com/docs/guides/prompt-caching) for current details.

  ## Fields

  * `:mode` - **optional** - `ExOpenAI.Components.PromptCacheModeEnum.t()`
    Controls whether OpenAI automatically creates an implicit cache breakpoint. Defaults to `implicit`. With `implicit`, OpenAI creates one implicit breakpoint and writes up to the latest three explicit breakpoints in the request. With `explicit`, OpenAI does not create an implicit breakpoint and writes up to the latest four explicit breakpoints. If there are no explicit breakpoints, the request does not use prompt caching.

  * `:ttl` - **optional** - `ExOpenAI.Components.PromptCacheTTLEnum.t()`
    The minimum lifetime applied to every implicit and explicit cache breakpoint written by the request. Defaults to `30m`, which is currently the only supported value. The backend may retain cache entries for longer.
  """
  @type t() :: %{
          __struct__: __MODULE__,
          mode: ExOpenAI.Components.PromptCacheModeEnum.t() | nil,
          ttl: ExOpenAI.Components.PromptCacheTTLEnum.t() | nil
        }
  @typedoc "Accepted struct or atom-keyed input map."
  @type input() ::
          t()
          | %{
              optional(:mode) => ExOpenAI.Components.PromptCacheModeEnum.input(),
              optional(:ttl) => ExOpenAI.Components.PromptCacheTTLEnum.input()
            }
  defstruct [:mode, :ttl]
end
